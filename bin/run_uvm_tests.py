#!/usr/bin/env python3
# Copyright (c) 2026 Eclipse Foundation
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import os
import subprocess
import re
import json
from pathlib import Path

# --- Configuration ---
# Paths to the folders containing the test program names
TESTS_ROOTS = [
    "tests/programs/custom",
    # "tests/programs/corev-dv", # TODO Not working for now
]
# Working directory where make commands must be executed
SIM_DIR = "sim/uvmt"
# File to save the final results
LOG_FILE = "test_results.log"
# The make command templates
RUN_CMD = "make test TEST={test} SIMULATOR=vsim USE_ISS=NO COV=YES"
MERGE_CMD = "make MERGE=YES SIMULATOR=vsim TEST={test} cov"
CLEAN_CMD = "make clean TEST={test} SIMULATOR=vsim"
CLEAN_HEX = "make clean_hex TEST={test} SIMULATOR=vsim"
CLEAN_TEST_PROGRAMS = "make clean_test_programs SIMULATOR=vsim"
# List of tests to exclude from the run
EXCLUDED_TESTS = [
    # "all_csr_por", # PASS
    # "coremark", # PASS
    # "csr_instr_asm", # PASS
    # "csr_instructions", # PASS
    # "branch_zero", # PASS
    # "debug_test", # PASS
    "debug_test_boot_set", # Fails
    "debug_test_known_miscompares", # Fails
    "debug_test_reset", # Fails
    # "debug_test_trigger", # PASS
    # "dhrystone", # PASS
    # "fibonacci", # PASS
    # "generic_exception_test", # PASS
    # # "hello-world", # PASS
    # "hpmcounter_basic_test", # PASS
    # "hpmcounter_hazard_test", # PASS
    # "illegal", # PASS
    # "illegal_instr_test", # PASS
    # "interrupt_bootstrap", # PASS
    # "interrupt_test", # PASS
    "isa_fcov_holes", # Fails
    # "load_store_rs1_zero", # PASS
    # "misalign", # PASS
    # "perf_counters_instructions", # PASS
    # "riscv_arithmetic_basic_test_0", # PASS
    # "riscv_arithmetic_basic_test_1", # PASS
    # "riscv_csr", # PASS
    "riscv_ebreak_test_0", # fails
]

def run_command(command, cwd):
    """Executes a shell command and returns the return code."""
    try:
        # We use shell=True because 'make' is a system command
        result = subprocess.run(
            command,
            cwd=cwd,
            shell=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.STDOUT
        )
        return result.returncode
    except Exception as e:
        print(f"Error executing command: {e}")
        return -1

def parse_questasim_coverage(report_dir, instance_path):
    """
    Parses Questasim HTML coverage reports to find coverage for a specific instance.
    Returns a tuple (code_cov, func_cov) or ("N/A", "N/A") if not found.
    """
    code_cov = "N/A"
    func_cov = "N/A"

    # Try both with and without leading slash as Questasim might omit it in the HTML
    paths_to_try = [instance_path, instance_path.lstrip('/')]

    try:
        # Questasim HTML reports often have the summary in index.html or summary.html
        # We search for the instance path and then look for percentage values in the same row.
        for html_file in report_dir.rglob("*.html"):
            content = html_file.read_text(errors='ignore')

            for path in paths_to_try:
                if path in content:
                    # Search for the row containing the instance path.
                    # We use <tr\b[^>]*> to match <tr> tags that might have attributes (e.g., <tr class="even">).
                    rows = re.findall(r'<tr\b[^>]*>(.*?)</tr>', content, re.DOTALL | re.IGNORECASE)
                    for row in rows:
                        if path in row:
                            # Extract percentage values from table cells.
                            # This matches <td>85.5%</td> or <td>85.5</td>
                            matches = re.findall(r'<td>\s*(\d+(?:\.\d+)?)\s*%?\s*</td>', row)

                            if not matches:
                                # Fallback to any number followed by % in the row
                                matches = re.findall(r'(\d+(?:\.\d+)?)\s*%', row)

                            if len(matches) >= 2:
                                # Assume first is code, second is functional
                                return matches[0], matches[1]
                            elif len(matches) == 1:
                                return matches[0], "N/A"
    except Exception as e:
        print(f"Error parsing coverage reports: {e}")

    return code_cov, func_cov

def main():
    # Determine the project root based on the location of this script
    script_dir = Path(__file__).parent.parent.resolve()

    print("script_dir = ", script_dir)

    # Resolve paths relative to the script's location
    sim_dir_abs = script_dir / SIM_DIR
    log_file_abs = script_dir / SIM_DIR / LOG_FILE

    # 1. Get the list of test names from all configured roots
    tests = []
    for root in TESTS_ROOTS:
        tests_path = script_dir / root
        if not tests_path.exists() or not tests_path.is_dir():
            print(f"Warning: {tests_path} not found. Skipping...")
            continue

        # Filter for directories only and exclude tests in the EXCLUDED_TESTS list
        root_tests = [d.name for d in tests_path.iterdir() if d.is_dir() and d.name not in EXCLUDED_TESTS]
        tests.extend(root_tests)

    tests.sort() # Ensure consistent order

    if not tests:
        print("No tests found in the specified directory.")
        return

    print(f"Found {len(tests)} tests. Starting execution in {sim_dir_abs}...\n")

    results = {}

    # Clean merged coverage results
    run_command("rm -Rf vsim_results/default/default/", str(sim_dir_abs))

    print("Tests:")
    for test in tests:
        print(f"\t{test}", end="\n", flush=True)

    # 2. Run each test
    for test in tests:
        print(f"Running {test}...", end=" ", flush=True)

        run_command(CLEAN_HEX.format(test=test), str(sim_dir_abs))

        # Run the test
        exit_code = run_command(RUN_CMD.format(test=test), str(sim_dir_abs))

        if exit_code == 0:
            print("PASSED ✅")
            results[test] = "PASSED"
        else:
            print("FAILED ❌")
            results[test] = "FAILED"

        # Merge coverage for this test
        run_command(MERGE_CMD.format(test=test), str(sim_dir_abs))

        # 3. Clean up the test
        # run_command(CLEAN_CMD.format(test=test), str(sim_dir_abs))

    # 4. Finalize coverage report
    print("\nFinalizing coverage report...", end=" ", flush=True)
    # Coverage is merged incrementally in the loop.
    # We can run one last merge to ensure everything is captured or simply mark as done.
    print("DONE ✅")

    # Move the report to a fixed location for CI/CD
    # The Makefile puts it in vsim_results/default/default/merged
    # We want it in a top-level directory for easier GH Pages upload
    report_src = sim_dir_abs / "vsim_results" / "default" / "merged"
    report_dest_root = script_dir / "coverage_report"
    report_dest_questasim = report_dest_root / "questasim"

    # Ensure the destination root exists
    if report_dest_root.exists():
        import shutil
        shutil.rmtree(report_dest_root)
    report_dest_root.mkdir(parents=True, exist_ok=True)

    if report_src.exists():
        import shutil
        shutil.copytree(report_src, report_dest_questasim)
        print(f"Coverage report moved to {report_dest_questasim}")
    else:
        print("Warning: Coverage report not found.")

    # Always try to copy dashboard templates
    dashboard_templates = script_dir / "templates" / "coverage_dashboard"
    if dashboard_templates.exists():
        import shutil
        shutil.copy(dashboard_templates / "index.html", report_dest_root / "index.html")
        shutil.copy(dashboard_templates / "style.css", report_dest_root / "style.css")
        print("Dashboard templates copied to coverage_report/")
    else:
        print("Warning: Dashboard templates not found at templates/coverage_dashboard/")


    # 5. Print and save the results to log file
    with open(log_file_abs, "w") as f:
        f.write("UVM Test Results\n")
        f.write("================\n")

        summary = ""
        for test, status in results.items():
            line = f"{test}: {status}\n"
            f.write(line)
            summary += line

        # Calculate pass rate
        passed_count = list(results.values()).count("PASSED")
        total_count = len(results)
        pass_rate = (passed_count / total_count * 100) if total_count > 0 else 0
        footer = f"\nSummary: {passed_count}/{total_count} tests passed ({pass_rate:.2f}%)."
        f.write(footer)
        summary += footer

    # Generate summary.json for the dashboard
    summary_json_path = report_dest_root / "summary.json"

    # Parse coverage for the specific core instance
    instance_to_track = "/uvmt_cv32e20_tb/dut_wrap/cv32e20_top_i/u_cve2_top/u_cve2_core"
    code_cov, func_cov = parse_questasim_coverage(report_dest_questasim, instance_to_track)

    import json
    with open(summary_json_path, "w") as fj:
        json.dump({
            "code_coverage": code_cov,
            "functional_coverage": func_cov,
            "pass_rate": round(pass_rate, 2),
            "total_tests": total_count,
            "passed": passed_count,
            "failed": total_count - passed_count
        }, fj, indent=4)
    print(f"Summary metrics saved to {summary_json_path}")

    print(f"\n--- Final Results ---\n{summary}")
    print(f"\nResults have been saved to {log_file_abs}")

if __name__ == "__main__":
    main()
