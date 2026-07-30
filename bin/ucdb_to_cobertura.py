# Copyright (c) 2026 Eclipse Foundation
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import subprocess
import xml.etree.ElementTree as ET
import re
import os
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


def generate_cobertura_xml(ucis_xml_path, output_path, instance_path=None):
    """Generate Cobertura XML format from UCIS XML file.
    
    Args:
        ucis_xml_path: Path to the UCIS XML file
        output_path: Path for the output Cobertura XML file
        instance_path: Optional hierarchical path to filter by instance (not used for UCIS)
    """
    try:
        # Parse the UCIS XML file
        tree = ET.parse(ucis_xml_path)
        root = tree.getroot()
    except Exception as e:
        print(f"Error parsing UCIS XML file {ucis_xml_path}: {e}")
        return False
    
    # Extract overall metrics from UCIS
    # UCIS structure: <coverage><scopes><scope><counters><counter type="statement">...</counter>...</counters></scope></scopes></coverage>
    line_rate = 0.0
    branch_rate = 0.0
    
    # Namespace handling for UCIS
    ns = {'ucis': 'http://unified-coverage-interoperability-standard.org/ns/1.0'}
    
    try:
        # Get overall statement coverage
        stmt_counter = root.find('.//ucis:counter[@type="statement"]', ns)
        if stmt_counter is not None:
            covered = int(stmt_counter.get('covered', '0'))
            total = int(stmt_counter.get('total', '1'))
            if total > 0:
                line_rate = covered / total
        
        # Get overall branch coverage
        branch_counter = root.find('.//ucis:counter[@type="branch"]', ns)
        if branch_counter is not None:
            covered = int(branch_counter.get('covered', '0'))
            total = int(branch_counter.get('total', '1'))
            if total > 0:
                branch_rate = covered / total
    except Exception as e:
        print(f"Warning: Could not extract overall metrics from UCIS: {e}")
    
    # Create the Cobertura XML structure
    cobertura = ET.Element('coverage')
    cobertura.set('version', '4.0.3')
    cobertura.set('timestamp', str(int(Path(__file__).parent.parent.resolve().stat().st_mtime * 1000)))
    cobertura.set('line-rate', f"{line_rate:.2f}")
    cobertura.set('branch-rate', f"{branch_rate:.2f}")
    
    # Calculate totals for line coverage
    total_lines = 0
    total_hits = 0
    
    sources = ET.SubElement(cobertura, 'sources')
    # Add source root (we'll use current directory as default)
    ET.SubElement(sources, 'source').text = '.'
    
    packages = ET.SubElement(cobertura, 'packages')
    
    # Process each source file in UCIS
    # UCIS structure: <coverage><scopes><scope><source_files><source_file location="path/to/file.v">...</source_file></source_files></scope></scopes></coverage>
    for source_file in root.findall('.//ucis:source_file', ns):
        file_path = source_file.get('location', '')
        if not file_path:
            continue
        
        # Get relative path
        file_path_obj = Path(file_path)
        # Use the path as-is for the package/name structure
        package_name = str(file_path_obj.parent)
        file_name = file_path_obj.name
        
        # Get line coverage data for this file
        # UCIS structure: <source_file><lines><line number="10" status="covered" hit_count="3"/></lines></source_file>
        lines_found = set()
        lines_hit = set()
        
        for line_elem in source_file.findall('.//ucis:line', ns):
            line_num_str = line_elem.get('number')
            status = line_elem.get('status', '')
            
            if line_num_str:
                line_num = int(line_num_str)
                lines_found.add(line_num)
                if status == 'covered':
                    lines_hit.add(line_num)
        
        total_lines += len(lines_found)
        total_hits += len(lines_hit)
        
        # Create package element
        package = ET.SubElement(packages, 'package')
        package.set('name', package_name)
        package.set('line-rate', f"{len(lines_hit) / len(lines_found):.2f}" if lines_found else '0')
        package.set('branch-rate', '0')
        package.set('complexity', '0')
        
        # Add classes element
        classes = ET.SubElement(package, 'classes')
        
        # Add class element (Cobertura uses class for each file)
        cls = ET.SubElement(classes, 'class')
        cls.set('name', file_name)
        cls.set('filename', file_path)
        cls.set('line-rate', f"{len(lines_hit) / len(lines_found):.2f}" if lines_found else '0')
        cls.set('branch-rate', '0')
        cls.set('complexity', '0')
        
        # Add lines element
        lines = ET.SubElement(cls, 'lines')
        
        # Add line elements
        for line_num in sorted(lines_found):
            line_elem = ET.SubElement(lines, 'line')
            line_elem.set('number', str(line_num))
            line_elem.set('hits', str(1) if line_num in lines_hit else '0')
    
    # Update coverage attributes with actual totals
    if total_lines > 0:
        cobertura.set('line-rate', f"{total_hits / total_lines:.2f}")
    else:
        cobertura.set('line-rate', '0')
    
    # Write the XML file
    tree = ET.ElementTree(cobertura)
    tree.write(output_path, encoding='utf-8', xml_declaration=True)
    
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
