# Copyright (c) 2026 Eclipse Foundation
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import subprocess
import json
import os
from pathlib import Path


def extract_coverage_metrics(ucdb_path, instance_path):
    """Extract TRL5 coverage metrics from merged UCDB file.
    
    Args:
        ucdb_path: Path to the merged UCDB file
        instance_path: Hierarchical path to the design instance to track
        
    Returns:
        dict: Dictionary with coverage metrics (statement, branch, condition, fsm_state)
              or None if extraction fails
    """
    # Set environment variable for the TCL script
    env = os.environ.copy()
    env['COV_INSTANCE'] = instance_path

    # Path to the TCL script (relative to this script)
    script_dir = Path(__file__).parent
    tcl_script = script_dir / '..' / 'sim' / 'tools' / 'vsim' / 'coverage_extract.tcl'

    # Run vcover with summary report
    cmd = ['vcover', 'report', '-summary', str(ucdb_path)]

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
            print(f"Error running vcover (stderr): {result.stderr}")
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


if __name__ == "__main__":
    # Test the function if run directly
    import sys
    if len(sys.argv) == 3:
        ucdb_path = sys.argv[1]
        instance_path = sys.argv[2]
        metrics = extract_coverage_metrics(ucdb_path, instance_path)
        print("Extracted metrics:")
        print(json.dumps(metrics, indent=2))
    else:
        print("Usage: python extract_coverage_metrics.py <ucdb_path> <instance_path>")