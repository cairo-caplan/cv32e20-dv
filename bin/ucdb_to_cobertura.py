# Copyright (c) 2026 Eclipse Foundation
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import subprocess
import xml.etree.ElementTree as ET
import re
import os
import time
from pathlib import Path


def extract_ucdb_metrics(ucdb_path, instance_path=None):
    """Extract coverage metrics from UCDB file using vcover.
    
    Args:
        ucdb_path: Path to the UCDB file
        instance_path: Optional hierarchical path to filter by instance
        
    Returns:
        dict: Dictionary with coverage metrics
    """
    env = os.environ.copy()
    if instance_path:
        env['COV_INSTANCE'] = instance_path
    
    # Path to the TCL script for extracting metrics
    script_dir = Path(__file__).parent
    tcl_script = script_dir / '..' / 'sim' / 'tools' / 'vsim' / 'coverage_extract.tcl'
    
    cmd = ['vcover', 'report', '-output', 'metrics.txt', '-summary', str(ucdb_path)]
    
    try:
        result = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            universal_newlines=True,
            env=env,
            cwd=str(script_dir.parent.parent)
        )
        
        if result.returncode != 0:
            # Log the error but don't let it stop everything if possible,
            # though here it's critical for metrics.
            # Print stderr and stdout for debugging.
            print(f"Error running vcover (stderr): {result.stderr}")
            print(f"Error running vcover (stdout): {result.stdout}")
            return None
        
        # Parse the output
        metrics = {}
        for line in result.stdout.strip().split('\n'):
            if ':' in line:
                key, value = line.split(':', 1)
                try:
                    metrics[key.lower()] = float(value)
                except ValueError:
                    metrics[key.lower()] = value
        
        return metrics
    except Exception as e:
        print(f"Error extracting coverage: {e}")
        return None


# Questa's `vcover report -xml` (as invoked by run_tests.py) emits a per-
# instance rollup document -- <coverage_report><code_coverage_report
# byInstance="1"><instanceData path="..." du="..."><statements active hits
# percent/>...</instanceData>... -- with NO namespace and, crucially, NO
# per-source-file or per-line detail. The earlier converter searched for
# namespaced <source_file>/<line number status> elements that Questa never
# writes, so every findall() matched nothing and the output was an empty
# <packages/>. This function parses the real schema instead.
#
# Mapping: Cobertura "lines" map to Questa statement coverage and "branch-rate"
# to Questa branch coverage. The fec_conditions / states / transitions rollups
# (conditions and FSM) have no Cobertura slot, so they are intentionally not
# modelled here -- the dashboard reads those straight from summary.json instead.


def _parse_int(value, default=0):
    """Parse an int attribute, tolerating Questa's non-numeric values ('na')."""
    try:
        return int(value)
    except (TypeError, ValueError):
        return default


def generate_cobertura_xml(ucis_xml_path, output_path, instance_path=None):
    """Generate Cobertura XML from Questa's per-instance coverage export.

    Args:
        ucis_xml_path: Path to the Questa UCIS XML file (merged.ucis.xml).
        output_path: Path for the output Cobertura XML file.
        instance_path: Optional hierarchical path (e.g. the core instance). When
            given, only instances at or below this path are counted, so totals
            reflect that subtree rather than the whole simulation tree.
    """
    try:
        tree = ET.parse(ucis_xml_path)
    except Exception as e:
        print(f"Error parsing UCIS XML file {ucis_xml_path}: {e}")
        return False

    root = tree.getroot()

    # instanceData carries the code-coverage rollups. iter() finds them whether
    # nested under <code_coverage_report> or elsewhere; the functional-coverage
    # section has no instanceData, so it contributes nothing here.
    instances = list(root.iter('instanceData'))

    def in_scope(inst_path):
        if not instance_path:
            return True
        # Match the instance itself and everything beneath it. Append '/' so a
        # sibling sharing a name prefix (foo vs foobar) is not swept in.
        return inst_path == instance_path or inst_path.startswith(instance_path + '/')

    total_statements = 0
    covered_statements = 0
    total_branches = 0
    covered_branches = 0

    cobertura = ET.Element('coverage')
    cobertura.set('version', '4.0.3')
    cobertura.set('timestamp', str(int(time.time() * 1000)))

    sources = ET.SubElement(cobertura, 'sources')
    ET.SubElement(sources, 'source').text = '.'

    packages = ET.SubElement(cobertura, 'packages')

    for inst in instances:
        inst_path = inst.get('path', '')
        if not inst_path or not in_scope(inst_path):
            continue

        statements = inst.find('statements')
        branches = inst.find('branches')
        # Skip leaf nodes that report neither line nor branch data (e.g.
        # assertion-only or covergroup-only instances).
        if statements is None and branches is None:
            continue

        stmt_active = _parse_int(statements.get('active')) if statements is not None else 0
        stmt_hits = _parse_int(statements.get('hits')) if statements is not None else 0
        branch_active = _parse_int(branches.get('active')) if branches is not None else 0
        branch_hits = _parse_int(branches.get('hits')) if branches is not None else 0

        total_statements += stmt_active
        covered_statements += min(stmt_hits, stmt_active)
        total_branches += branch_active
        covered_branches += min(branch_hits, branch_active)

        line_rate = (min(stmt_hits, stmt_active) / stmt_active) if stmt_active else 0.0
        inst_branch_rate = (min(branch_hits, branch_active) / branch_active) if branch_active else 0.0

        du_name = inst.get('du', '') or inst_path.rsplit('/', 1)[-1]
        package_name = du_name or 'top'

        package = ET.SubElement(packages, 'package')
        package.set('name', package_name)
        package.set('line-rate', f"{line_rate:.2f}")
        package.set('branch-rate', f"{inst_branch_rate:.2f}")
        package.set('complexity', '0')

        classes = ET.SubElement(package, 'classes')
        cls = ET.SubElement(classes, 'class')
        cls.set('name', du_name or inst_path)
        cls.set('filename', inst_path)
        cls.set('line-rate', f"{line_rate:.2f}")
        cls.set('branch-rate', f"{inst_branch_rate:.2f}")
        cls.set('complexity', '0')

        # Questa's byInstance export has no per-line detail, so synthesise one
        # Cobertura line per active statement (first `hits` marked covered). This
        # preserves the exact coverage rate for tools that read <lines>.
        lines = ET.SubElement(cls, 'lines')
        if stmt_active:
            for n in range(1, stmt_active + 1):
                line_elem = ET.SubElement(lines, 'line')
                line_elem.set('number', str(n))
                line_elem.set('hits', '1' if n <= stmt_hits else '0')

    overall_line_rate = (covered_statements / total_statements) if total_statements else 0.0
    overall_branch_rate = (covered_branches / total_branches) if total_branches else 0.0

    cobertura.set('line-rate', f"{overall_line_rate:.2f}")
    cobertura.set('branch-rate', f"{overall_branch_rate:.2f}")
    cobertura.set('lines-valid', str(total_statements))
    cobertura.set('lines-covered', str(covered_statements))
    cobertura.set('branches-valid', str(total_branches))
    cobertura.set('branches-covered', str(covered_branches))

    if total_statements == 0 and total_branches == 0:
        scope_note = f" under {instance_path}" if instance_path else ""
        print(f"warning: no statement/branch coverage data{scope_note} found in "
              f"{ucis_xml_path}; Cobertura output will be empty")
    else:
        print(f"Cobertura: {len(packages)} instances, "
              f"statements {covered_statements}/{total_statements} "
              f"({overall_line_rate * 100:.2f}%), branches "
              f"{covered_branches}/{total_branches} ({overall_branch_rate * 100:.2f}%)")

    ET.indent(cobertura) if hasattr(ET, 'indent') else None
    out_tree = ET.ElementTree(cobertura)
    out_tree.write(output_path, encoding='utf-8', xml_declaration=True)

    return True


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Convert UCIS coverage data to Cobertura XML format.')
    parser.add_argument('ucis_path', help='Path to the UCIS XML file')
    parser.add_argument('--output-dir', default='.', help='Output directory for generated files')
    parser.add_argument('--instance', help='Hierarchical path to the design instance to track (for compatibility)')
    parser.add_argument('--cobertura', action='store_true', help='Generate Cobertura XML file')

    args = parser.parse_args()

    ucis_path = Path(args.ucis_path)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Generate Cobertura XML
    if args.cobertura or True:  # Default to True for backward compatibility
        cobertura_path = output_dir / 'cobertura.xml'
        print(f"Generating Cobertura XML file: {cobertura_path}")
        if generate_cobertura_xml(ucis_path, cobertura_path, args.instance):
            print("Successfully generated Cobertura XML file")
        else:
            print("Failed to generate Cobertura XML file")


if __name__ == "__main__":
    main()
