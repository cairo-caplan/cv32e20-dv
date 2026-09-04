#!/usr/bin/env python3
# Copyright (c) 2026 Eclipse Foundation
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
"""
Run the cleaned-up directed test-programs (C and assembly) on a CV32E20
testbench and print a pass/fail summary.  Either testbench can be selected
with --tb:

    core   the Verilator core testbench in sim/core            (default)
    uvmt   the UVM testbench in sim/uvmt, run with SIMULATOR=vsim

For each selected test the script invokes `make test TEST=<name> ...` in the
chosen testbench's sim directory, then parses the per-test log it leaves behind
for the verdict banner:

    core : sim/core/simulation_results/<name>/<run>/test_program/<name>.log
           "ALL TESTS PASSED"   -> PASS   (tb/core/tb_top.sv)
           "TEST(S) FAILED!"    -> FAIL

    uvmt : sim/uvmt/vsim_results/<cfg>/<name>/<run>/vsim-<name>.log
           "SIMULATION PASSED"  -> PASS   (tb/uvmt/uvmt_cv32e20_tb.sv;
                                           includes "PASSED with WARNINGS")
           "SIMULATION FAILED"  -> FAIL

Anything else (no banner, build error, timeout) is reported as ERROR.
The process exit code is 0 only if every test that was run reported PASS.

corev-dv tests (see COREV_DV_TESTS below) additionally need `make corev-dv`
run once beforehand to clone and compile the corev-dv/riscv-dv packages
(uvmt only). Whenever the selected set includes any corev-dv test, this
script runs `make corev-dv` itself before running any tests, and aborts if
that setup step fails.

For corev-dv tests, --run-index also selects which generated program directory
is used: run_test() passes it through as both RUN_INDEX (where the build/run
step looks for the program) and GEN_START_INDEX (where gen_corev-dv writes it).
run_test() also passes SEED=random for every corev-dv test, so each invocation
uses a fresh RNDSEED (mk/uvmt/uvmt.mk derives it from `date +%N`) for both the
corev-dv generator and the env-level randomization -- re-running the same
--run-index does NOT reproduce the same generated program/stimulus anymore.
The actual seed used is recorded in that run's vsim-<name>.log header
(`-sv_seed <value>`) for later replay via SEED=<value>.

Usage
-----
The script needs no arguments and can be run from anywhere (paths are resolved
relative to its own location in <repo>/bin).  A working RISC-V toolchain plus
the relevant simulator (Verilator for core, Questa vsim for uvmt) must be on
PATH, as for a normal `make test`.

    # Run the full self-checking set (C + assembly) on the core TB:
    bin/run_tests.py
    python3 bin/run_tests.py                    # equivalent

    # Run the same set on the UVM testbench (vsim), plus UVMT_TESTS (directed
    # tests that only make sense under uvmt, e.g. nmi_test):
    bin/run_tests.py --tb uvmt
    # (equivalent to `make test TEST=<name> SIMULATOR=vsim` per test; the
    #  script sets SIMULATOR=vsim for you, so no need to export it yourself.)

    # Run only specific tests (by directory name under tests/programs/custom):
    bin/run_tests.py fibonacci misalign
    bin/run_tests.py --tb uvmt hello-world

    # Also run the parked tests (step-compare / debug; meaningful under --tb uvmt):
    bin/run_tests.py --include-parked
    bin/run_tests.py --tb uvmt --include-parked

    # Also run the passing corev-dv generated regression tests (uvmt only):
    bin/run_tests.py --tb uvmt --include-corev-dv

    # Run ONLY the corev-dv generated regression tests (uvmt only):
    bin/run_tests.py --tb uvmt --corev-dv-only

    # Skip simulation; just re-summarize logs from a previous run:
    bin/run_tests.py --parse-only
    bin/run_tests.py --tb uvmt --parse-only

    # Run up to 4 tests concurrently (uvmt only is verified safe -- see below):
    bin/run_tests.py --tb uvmt --corev-dv-only --jobs 4

    # Replay a specific prior corev-dv run from its logged seeds (gen_corev-dv
    # and test are independent UVM environments/vsim invocations, each with
    # their own seed -- see the summary table's GEN_SEED/RUN_SEED columns):
    bin/run_tests.py --tb uvmt --gen-seed 363891135 --run-seed 354410829 \
        corev_rand_instr_and_data_stalls

    # Collect code coverage (uvmt only; equivalent to `make test ... COV=1` per test):
    bin/run_tests.py --tb uvmt --cov hello-world

    # Full coverage regression: run the tests with COV=1, merge every PASSing
    # test's .ucdb into sim/uvmt/vsim_results/<cfg>/merged/merged.ucdb and
    # publish the whole report artifact set (see 'Coverage reports' below):
    bin/run_tests.py --tb uvmt --cov-report
    bin/run_tests.py --tb uvmt --all-custom --cov-report   # dynamic discovery variant

    # Regenerate the reports from an already-merged .ucdb, without running anything:
    bin/run_tests.py --tb uvmt --report-only

    # Re-run just the vcover merge for every selected test that already has a
    # .ucdb on disk (verdicts re-parsed from their logs), then regenerate reports:
    bin/run_tests.py --tb uvmt --merge-existing

    # Other options:
    #   --cfg NAME      uvmt config subdirectory                (default: default)
    #   --run-index N   RUN_INDEX subdirectory                  (default: 0)
    #   --gen-seed SEED corev-dv generator SEED ('random' or a literal value)
    #   --run-seed SEED test-step SEED ('random' or a literal value)
    #   --timeout SECS  per-test timeout                        (default: 1800)
    #   --jobs N, -j N  run up to N tests concurrently           (default: 1)
    #   --cov           collect code coverage (uvmt only)
    #   --cov-report    --cov + per-test merge + published report set (uvmt only)
    #   --all-custom    select every dir under tests/programs/custom (see below)
    #   --merge-existing  re-merge existing .ucdb files, then regenerate reports
    #   --report-only   skip execution; regenerate reports from existing data
    #   --clean-report  delete coverage_report/ before regenerating it
    #   --quiet         suppress per-test simulation banners
    #   -h / --help     full option help

Exit status is 0 only when every selected test PASSED, so the script is
suitable for use as a CI gate -- including the coverage regression, which runs
through the same pass/fail machinery (banner-based classify(), not make's exit
code) and therefore gates CI on test failures too. The one exception is
--report-only, which launches no simulation at all and always exits 0.

Coverage reports (--cov-report, uvmt only)
------------------------------------------
--cov alone only collects per-test .ucdb files; --cov-report adds the rest of
the published artifact set that CI deploys to GitHub Pages:

    coverage_report/index.html          dashboard (copied from templates/)
    coverage_report/style.css           dashboard stylesheet
    coverage_report/questasim/          vcover -html report of merged.ucdb
    coverage_report/merged.ucis.xml     UCIS XML export of merged.ucdb
    coverage_report/cobertura.xml       Cobertura XML (via ucdb_to_cobertura)
    coverage_report/summary.json        metrics consumed by index.html
    coverage_report/trl5_metrics.json   TRL5 line/cond/branch/FSM metrics
    sim/uvmt/test_results.log           plain-text pass/fail list

The merge step is `make MERGE=YES TEST=<name> cov` right after each PASS, which
(mk/uvmt/vsim.mk) makes merged.ucdb a real file target keyed on every .ucdb
discovered under vsim_results/<cfg>, so calling it once per test is an
incremental merge rather than a rebuild. Tests without a .ucdb (FAILED/ERROR
runs, or a batch without --cov) are skipped silently. Merges are serialised
behind a lock, since concurrent vcover writes against one merged.ucdb are not
safe. A --cov-report run wipes vsim_results/<cfg>/merged/ and coverage_report/
before it starts; --clean-report only does the latter.

--all-custom selects every directory under TESTS_ROOTS instead of the curated
lists above, which is what the coverage CI job uses so a newly added test
program is picked up without editing this script. PARKED and corev-dv names are
still skipped unless --include-parked / --include-corev-dv also ask for them,
and DISCOVERY_EXCLUDES is always skipped.

Concurrency (--jobs)
--------------------
By default (--jobs 1) each test runs its own `make test`/`make gen_corev-dv
test`, which recompiles the design every time (VSIM_RUN_PREREQ=opt unless
COMP=NO is passed). Running that concurrently would race multiple vlog/vopt
invocations against the same shared vsim work library
(sim/uvmt/vsim_results/<cfg>/work) -- a previously-confirmed hazard (lock
contention or "already an optimized design" errors).

With --jobs > 1 and --tb uvmt, this script instead compiles the design ONCE
up front (`make comp`, serialized, in addition to the existing one-time `make
corev-dv` setup for corev-dv tests) and then passes COMP=NO to every test in
the parallel batch, so workers only run `vsim` against the already-compiled
design. If --cov is also given, that one-time compile is done with COV=1 too
(otherwise the shared design has no +cover instrumentation and every
worker's .ucdb ends up with assertions/covergroups but zero statement/
branch/condition coverage, since COMP=NO skips each worker's own vopt) --
each worker runs in its own per-test/run-index run directory
(sim/uvmt/vsim_results/<cfg>/<test>/<run_index>/), which `make`'s `run`
target `vmap`s back to the shared read-only compiled library. Many `vsim`
processes reading one compiled snapshot concurrently is a standard, safe
regression-farm pattern; it's concurrent *compilation* that isn't safe.

Caveat: the corev-dv random-program *generation* step (gen_corev-dv) itself
runs vsim from within a directory shared by all corev-dv tests
(vsim_results/<cfg>/corev-dv/), unlike the isolated per-test run directories
above. This looks benign under concurrency (per-test/idx log files don't
collide, and the shared `vmap` writes identical content regardless of which
process wins the race) but has not been independently stress-tested at high
--jobs counts. Keep an eye on it if you push --jobs high for corev-dv-heavy
batches.

--tb core (Verilator) has NOT been verified race-free under --jobs > 1: `make
test` for the core TB also recompiles into a shared directory
(sim/core/cobj_dir) on every invocation, and no COMP=NO-equivalent skip-flag
was found for it. Prefer --jobs 1 there unless you've confirmed otherwise.

Also keep the vsim license pool in mind (`lmutil lmstat`) -- each concurrent
uvmt worker holds its own set of Questa feature licenses (msimhdlsim,
svverification, mtiverification, ...) for the duration of its run.
"""

import argparse
import concurrent.futures
import json
import os
import re
import shutil
import signal
import subprocess
import sys
import threading
from pathlib import Path

# Repository layout: this script lives in <repo>/bin.
SCRIPT_DIR = Path(__file__).resolve().parent
REPO = SCRIPT_DIR.parent

# The coverage-report pipeline reuses the Cobertura converter that lives next to
# this script in <repo>/bin (it remains usable stand-alone).
sys.path.insert(0, str(SCRIPT_DIR))
from ucdb_to_cobertura import generate_cobertura_xml  # noqa: E402

# Guards stdout so concurrent workers (--jobs > 1) don't interleave lines from
# different tests mid-block; each worker holds it only long enough to print
# its own (possibly multi-line) announcement or banner block.
_print_lock = threading.Lock()

# Serialises the per-test `make MERGE=YES ... cov` calls of a --cov-report
# batch: every one of them rewrites the same vsim_results/<cfg>/merged.ucdb via
# vcover, which is not safe to run against itself.
_merge_lock = threading.Lock()

# Per-testbench configuration.  Each entry knows where to run make, which extra
# make arguments to pass, the verdict banners its testbench prints, and how to
# locate a test's log file.
TESTBENCHES = {
    "core": {
        "sim_dir": REPO / "sim" / "core",
        "make_args": [],
        "pass_banner": "ALL TESTS PASSED",
        "fail_banner": "TEST(S) FAILED!",
        # Progress lines worth echoing while a test runs.
        "markers": ("tb_top]", "SUCCESS", "FAIL"),
    },
    "uvmt": {
        "sim_dir": REPO / "sim" / "uvmt",
        "make_args": ["SIMULATOR=vsim", "USE_ISS=NO"],
        "pass_banner": "SIMULATION PASSED",
        "fail_banner": "SIMULATION FAILED",
        "markers": ("SIMULATION PASSED", "SIMULATION FAILED",
                    "UVM_ERROR :", "UVM_FATAL :", "TEST PASSED", "TEST FAILED"),
        # Hierarchy the coverage report and TRL5 metrics are scoped to.
        "cov_instance": "/uvmt_cv32e20_tb/dut_wrap/cv32e20_top_i/u_cve2_top/u_cve2_core",
    },
}

# Self-checking C test-programs cleaned up on this branch.  These verify their
# own results and signal the canonical pass/fail, so they pass on the core TB.
C_TESTS = [
    "hello-world",
    "fibonacci",
    "branch_zero",
    "coremark",
    "dhrystone",
#    "all_csr_por",
    "csr_instructions",
    "hpmcounter_basic_test",
    "illegal",
    "misalign",
    "interrupt_test",
    "interrupt_bootstrap",
    "debug_test",
]

# Self-checking assembly test-programs cleaned up on this branch.  Each was
# fixed to build and to signal end-of-test through the canonical protocol
# (TEST_PASS/TEST_FAIL in bsp/cv32e20_dv.h, writing 123456789 / 1); each passes
# on the core TB.
ASM_TESTS = [
    "load_store_rs1_zero",
    "illegal_instr_test",
    "generic_exception_test",
    "csr_instr_asm",
]

# Default (core TB) selection: every self-checking test, C and assembly.
TESTS = C_TESTS + ASM_TESTS

# Parked tests: these build and signal correctly, but their *meaningful*
# verification is not a self-check on the core TB.  Included only with
# --include-parked, and intended to be run with --tb uvmt:
#   * riscv_arithmetic_basic_test_0/1 and csr_instr_asm exercise long fixed
#     instruction streams whose correctness is checked by the RVFI step-compare
#     against the Spike ISS (sim/uvmt); on the core TB they pass *vacuously*.
#   * riscv_csr additionally needs the M-only counter-CSR reconciliation (see
#     README parked-work notes).
#   * the debug_test variants need the uvmt debug-request stimulus; on the core
#     TB they report FAIL because debug mode is never entered.
PARKED = [
    "riscv_arithmetic_basic_test_0",
    "riscv_arithmetic_basic_test_1",
    "csr_instr_asm",
    "riscv_csr",
    "perf_counters_instructions",
    "debug_test_boot_set",
    "debug_test_reset",
    "debug_test_known_miscompares",
    "debug_test_trigger",
]

# Directed tests that are part of the standard regression (unlike PARKED,
# not opt-in) but only make sense on the uvmt TB, since they need uvmt-only
# stimulus with no core-TB equivalent. Automatically added to the default
# selection whenever --tb uvmt is chosen (see main()); ignored for --tb core.
#   * nmi_test needs the uvmt interrupt-agent's +nmi_assert stimulus (see
#     uvme_cv32e20_nmi_assert_vseq.sv); on the core TB the NMI line is never
#     asserted.
UVMT_TESTS = [
    "nmi_test",
]

# corev-dv (OpenHW's class extensions of Google's riscv-dv) generated regression
# templates under tests/programs/corev-dv/.  Unlike C_TESTS/ASM_TESTS/PARKED,
# each of these needs its randomized test program generated before it can be
# built and run, i.e. `make gen_corev-dv test TEST=<name>` rather than plain
# `make test TEST=<name>`, where run_test() adds the extra target automatically for
# names in this list. Meaningful only under --tb uvmt (corev-dv generation is
# wired up for the uvmt testbench only); included only with --include-corev-dv
# or --corev-dv-only.
#
# Before any test in this list can build, `make corev-dv` (clone + compile the
# corev-dv/riscv-dv packages) must have been run once in sim/uvmt; main() does
# this automatically whenever the selected set includes a corev-dv test.
#
COREV_DV_TESTS = [
    "corev_rand_arithmetic_base_test",
    "corev_rand_instr_test",
    "corev_rand_interrupt",
    "corev_rand_interrupt_debug",
    "corev_rand_interrupt_exception",
    "corev_rand_interrupt_nested",
    "corev_rand_interrupt_wfi",
    "corev_rand_interrupt_wfi_mem_stress",
    "corev_rand_jump_stress_test",
    "corev_rand_debug",
    "corev_rand_debug_ebreak",
    "corev_rand_debug_single_step",
    "corev_rand_illegal_instr_test",
    "corev_rand_instr_long_stall",
    "corev_rand_instr_and_data_stalls",
]

# Roots scanned by --all-custom: every immediate subdirectory is taken as a test
# name. The curated lists above remain the default selection; --all-custom is
# the opt-in "run whatever is in the tree" mode used by the coverage CI job.
TESTS_ROOTS = [
    "tests/programs/custom",
    # "tests/programs/corev-dv", # TODO Not working for now
]

# Directories under TESTS_ROOTS that --all-custom must never select. Everything
# already covered by PARKED / COREV_DV_TESTS is skipped through those lists (see
# discover_all_custom()), so this only needs the known-broken tests that no
# curated list covers -- the debug_test_* failures excluded by the old
# bin/run_uvm_tests.py all live in PARKED now.
DISCOVERY_EXCLUDES = [
    "isa_fcov_holes",
    "riscv_ebreak_test_0",
]


def log_path(tb, test, run_index, cfg):
    """Location of the per-test simulation log for the given testbench."""
    sim_dir = TESTBENCHES[tb]["sim_dir"]
    if tb == "core":
        return (sim_dir / "simulation_results" / test / str(run_index)
                / "test_program" / f"{test}.log")
    # uvmt / vsim
    return (sim_dir / "vsim_results" / cfg / test / str(run_index)
            / f"vsim-{test}.log")


def gen_log_path(tb, test, run_index, cfg):
    """Location of the corev-dv generation step's own log file. This is a
    fully separate vsim invocation/UVM environment from the test's own
    vsim-<test>.log (log_path() above) -- gen_corev-dv builds the randomized
    instruction stream, test builds+runs the firmware -- so it gets its own
    independent -sv_seed. GEN_NUM_TESTS is never overridden by this script
    (Makefile default 1), hence the fixed "_1" in the filename."""
    sim_dir = TESTBENCHES[tb]["sim_dir"]
    return (sim_dir / "vsim_results" / cfg / "corev-dv" / test
            / f"{test}_{run_index}_1.log")


_SEED_RE = re.compile(r"-sv_seed\s+(\S+)")


def extract_seed(text):
    """Pull the actual -sv_seed value a vsim invocation was run with out of
    its console output or log file. Needed whenever SEED=random is used --
    the Makefile picks the real value internally (`date +%N`), so the caller
    never sees it on the command line it constructed."""
    m = _SEED_RE.search(text)
    return m.group(1) if m else None


def classify(text, tbcfg):
    """Return 'PASS', 'FAIL', or 'ERROR' for a chunk of log/console text."""
    if tbcfg["pass_banner"] in text:
        return "PASS"
    if tbcfg["fail_banner"] in text:
        return "FAIL"
    return "ERROR"


def make_env(tbcfg):
    """Environment for a make invocation: os.environ plus tbcfg's make_args
    (e.g. SIMULATOR=vsim) mirrored in, so any sub-make/shell that reads the
    variable directly behaves consistently with what's on the command line."""
    env = os.environ.copy()
    for arg in tbcfg["make_args"]:
        key, _, val = arg.partition("=")
        if val:
            env[key] = val
    return env


def _run(cmd, cwd, env, timeout, capture):
    """Run cmd in its own process group (session) so a timeout can kill the
    whole tree, not just the immediate child. Without this, a `make` that
    times out leaves its own child (e.g. vsim) running as an orphan: the
    simulation keeps going for real in the background while the script
    reports a false timeout and moves on to the next test."""
    proc = subprocess.Popen(
        cmd,
        cwd=cwd,
        env=env,
        start_new_session=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
        universal_newlines=True,
    )
    try:
        stdout, stderr = proc.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        os.killpg(os.getpgid(proc.pid), signal.SIGKILL)
        proc.communicate()
        raise
    return proc.returncode, stdout, stderr


def setup_corev_dv(tb, timeout):
    """Run `make corev-dv` once: clones and compiles the corev-dv/riscv-dv
    packages.  Required before any COREV_DV_TESTS entry can build; aborts the
    script on failure since no corev-dv test can proceed without it."""
    tbcfg = TESTBENCHES[tb]
    cmd = ["make", "corev-dv"] + tbcfg["make_args"]
    env = make_env(tbcfg)

    print(f"[Setup/{tb}] make corev-dv ...")
    try:
        returncode, _, _ = _run(cmd, tbcfg["sim_dir"], env, timeout, capture=False)
    except subprocess.TimeoutExpired:
        sys.exit(f"error: 'make corev-dv' timed out after {timeout}s")
    except OSError as exc:
        sys.exit(f"error: could not launch 'make corev-dv': {exc}")

    if returncode != 0:
        sys.exit(f"error: 'make corev-dv' failed (exit {returncode}); "
                  "no corev-dv test can build without it")


def setup_comp(tb, timeout, cov=False):
    """Run `make comp` once: compiles the main testbench (uvmt_*_tb_vopt) into
    the shared work library. Required before a --jobs > 1 batch can safely
    pass COMP=NO to its workers -- without a compiled design already sitting
    in the shared library, every worker would either fail (nothing to run
    against) or race to compile it themselves. Aborts the script on failure.

    cov: pass COV=1 to this compile so vopt instruments the design with
    +cover -- required when the --jobs > 1 batch will also run with --cov,
    since workers pass COMP=NO and reuse this shared compile as-is (without
    this, every worker's .ucdb ends up with no statement/branch/condition
    coverage at all, only assertions/covergroups)."""
    tbcfg = TESTBENCHES[tb]
    cmd = ["make", "comp"] + tbcfg["make_args"]
    if cov:
        cmd.append("COV=1")
    env = make_env(tbcfg)

    print(f"[Setup/{tb}] make comp (one-time compile for --jobs > 1) ...")
    try:
        returncode, _, _ = _run(cmd, tbcfg["sim_dir"], env, timeout, capture=False)
    except subprocess.TimeoutExpired:
        sys.exit(f"error: 'make comp' timed out after {timeout}s")
    except OSError as exc:
        sys.exit(f"error: could not launch 'make comp': {exc}")

    if returncode != 0:
        sys.exit(f"error: 'make comp' failed (exit {returncode}); "
                  "no test can build without it")


def run_test(tb, test, run_index, cfg, timeout, quiet, extra_make_args=None,
             label=None, gen_seed="random", run_seed="random", cov=False):
    """Build+run one test on the chosen testbench; return
    (outcome, detail, gen_seed_used, run_seed_used).

    For corev-dv tests, gen_corev-dv (the corev-dv/riscv-dv random program
    generator) and test (the actual firmware run) are two fully independent
    UVM environments/vsim invocations that compile and run separately -- so
    each gets its own `make` invocation and its own independent SEED=
    assignment, rather than one combined `make gen_corev-dv test` call. That
    matters for reproduction: a single SEED=<literal value> on one combined
    invocation would force both steps to the *same* RNDSEED (mk/uvmt/uvmt.mk
    only re-derives a fresh value from `date +%N` when SEED=random; a literal
    value is just reused as-is), which can't reproduce a historical run where
    the two steps happened to draw different random seeds.
    gen_seed_used/run_seed_used are the actual -sv_seed values each step's
    vsim was invoked with (extracted from console/log output -- needed
    whenever SEED=random, since the Makefile picks the real value internally
    and it never appears on the command line this function constructs).
    Both are None for non-corev-dv tests, which have no separate generation
    step and are never given an explicit SEED.

    extra_make_args: additional make variable assignments appended to each
    command line (e.g. ["COMP=NO"] for a --jobs > 1 batch that already had
    setup_comp() run once beforehand).
    cov: pass COV=1 to the actual firmware build+run (equivalent to `make
    test ... COV=1`), so vopt instruments the design and Questa writes a
    .ucdb -- see docs/COVERAGE-MAKE-TARGETS.md for the report targets that
    consume it. Deliberately NOT passed to the gen_corev-dv step above: that's
    a separate UVM environment/vsim invocation (the random-program generator,
    unrelated to the DUT), so instrumenting it would be pointless.
    label: when set (--jobs > 1), prefixes each printed banner line with the
    test name so concurrent workers' output stays distinguishable; printing
    is done as one locked block per test so lines from different tests can't
    interleave mid-line.
    """
    tbcfg = TESTBENCHES[tb]
    env = make_env(tbcfg)
    gen_seed_used = None

    if test in COREV_DV_TESTS:
        # gen_corev-dv generates into <test>/$(GEN_START_INDEX)/test_program/,
        # independently of RUN_INDEX (which only selects where the build/run
        # step looks for that program). Without this, a non-zero --run-index
        # generates into .../0/ but builds/runs out of .../<run_index>/, which
        # is empty except for the BSP.
        gen_cmd = (["make", "gen_corev-dv", f"TEST={test}",
                     f"GEN_START_INDEX={run_index}", f"SEED={gen_seed}"]
                    + tbcfg["make_args"])
        if extra_make_args:
            gen_cmd += extra_make_args

        try:
            returncode, gstdout, gstderr = _run(gen_cmd, tbcfg["sim_dir"], env,
                                                 timeout, capture=True)
        except subprocess.TimeoutExpired:
            return "ERROR", f"gen_corev-dv timed out after {timeout}s", None, None
        except OSError as exc:
            return "ERROR", f"could not launch gen_corev-dv make: {exc}", None, None

        gen_seed_used = extract_seed(gstdout + gstderr)
        if gen_seed_used is None:
            gpath = gen_log_path(tb, test, run_index, cfg)
            if gpath.is_file():
                gen_seed_used = extract_seed(gpath.read_text(errors="replace"))

        if returncode != 0:
            return ("ERROR", f"gen_corev-dv failed (exit {returncode})",
                    gen_seed_used, None)

    cmd = ["make", "test", f"TEST={test}", f"RUN_INDEX={run_index}"]
    if test in COREV_DV_TESTS:
        cmd.append(f"SEED={run_seed}")
    if cov:
        cmd.append("COV=1")
    cmd += tbcfg["make_args"]
    if extra_make_args:
        cmd += extra_make_args

    try:
        returncode, stdout, stderr = _run(cmd, tbcfg["sim_dir"], env, timeout, capture=True)
    except subprocess.TimeoutExpired:
        return "ERROR", f"timed out after {timeout}s", gen_seed_used, None
    except OSError as exc:
        return "ERROR", f"could not launch make: {exc}", gen_seed_used, None

    if not quiet:
        lines = [line for line in stdout.splitlines()
                 if any(m in line for m in tbcfg["markers"])]
        if lines:
            prefix = f"    [{label}] " if label else "    "
            with _print_lock:
                for line in lines:
                    print(prefix + line)

    # The console output is authoritative for the run we just launched; fall
    # back to the on-disk log if the banner did not reach stdout.
    console = stdout + stderr
    run_seed_used = extract_seed(console)
    outcome = classify(console, tbcfg)
    if outcome == "ERROR" or run_seed_used is None:
        path = log_path(tb, test, run_index, cfg)
        if path.is_file():
            log_text = path.read_text(errors="replace")
            if outcome == "ERROR":
                outcome = classify(log_text, tbcfg)
            if run_seed_used is None:
                run_seed_used = extract_seed(log_text)

    if outcome != "ERROR":
        return outcome, "", gen_seed_used, run_seed_used
    if returncode != 0:
        return "ERROR", f"make exited {returncode}", gen_seed_used, run_seed_used
    return "ERROR", "no verdict banner", gen_seed_used, run_seed_used


def parse_only(tb, test, run_index, cfg):
    """Read an existing log file without re-running the simulation; return
    (outcome, detail, gen_seed_used, run_seed_used), same shape as run_test()."""
    path = log_path(tb, test, run_index, cfg)
    if not path.is_file():
        return "ERROR", "no log file", None, None

    text = path.read_text(errors="replace")
    run_seed_used = extract_seed(text)
    gen_seed_used = None
    if test in COREV_DV_TESTS:
        gpath = gen_log_path(tb, test, run_index, cfg)
        if gpath.is_file():
            gen_seed_used = extract_seed(gpath.read_text(errors="replace"))

    return classify(text, TESTBENCHES[tb]), "", gen_seed_used, run_seed_used


def discover_all_custom():
    """--all-custom: the immediate subdirectories of each TESTS_ROOTS entry as a
    sorted test-name list -- an opt-in alternative to the curated lists above,
    for callers (the coverage CI job) that want 'whatever is in the tree' rather
    than the same list maintained in two places.

    Skipped: DISCOVERY_EXCLUDES (known-broken and covered by no curated list),
    plus everything already listed in PARKED / COREV_DV_TESTS -- those stay
    opt-in through --include-parked / --include-corev-dv, which still append to
    the result as usual."""
    skip = set(PARKED) | set(COREV_DV_TESTS) | set(DISCOVERY_EXCLUDES)
    found = []
    for root in TESTS_ROOTS:
        root_dir = REPO / root
        if not root_dir.is_dir():
            print(f"warning: test root {root_dir} not found; skipping")
            continue
        found.extend(entry.name for entry in sorted(root_dir.iterdir())
                     if entry.is_dir() and entry.name not in skip)
    return sorted(found)


def merge_test_coverage(tb, test, run_index, cfg, timeout):
    """Merge one test's .ucdb into vsim_results/<cfg>/merged/merged.ucdb with
    `make MERGE=YES TEST=<test> cov`; return whether the merge actually ran.

    merged.ucdb is a real file target in mk/uvmt/vsim.mk keyed on every .ucdb
    found under vsim_results/<cfg>, so calling this once per test -- what the old
    bin/run_uvm_tests.py did -- is an incremental merge, not a full rebuild.
    A test with no .ucdb (a FAILED/ERROR run, or a batch that never ran with
    --cov) returns False silently: there is nothing for it to contribute.
    Serialised behind _merge_lock so a --jobs > 1 batch cannot race two vcover
    merges against one merged.ucdb."""
    tbcfg = TESTBENCHES[tb]
    ucdb_path = (tbcfg["sim_dir"] / "vsim_results" / cfg / test / str(run_index)
                 / f"{test}.ucdb")
    if not ucdb_path.is_file():
        return False

    cmd = ["make", "MERGE=YES", f"TEST={test}", "cov"] + tbcfg["make_args"]
    env = make_env(tbcfg)
    try:
        with _merge_lock:
            returncode, _, stderr = _run(cmd, tbcfg["sim_dir"], env, timeout,
                                         capture=True)
    except subprocess.TimeoutExpired:
        with _print_lock:
            print(f"warning: coverage merge for {test} timed out after {timeout}s")
        return False
    except OSError as exc:
        with _print_lock:
            print(f"warning: could not launch coverage merge for {test}: {exc}")
        return False

    if returncode != 0:
        last = (stderr or "").strip().splitlines()
        with _print_lock:
            print(f"warning: coverage merge for {test} failed (exit {returncode}): "
                  f"{last[-1] if last else 'no output'}")
        return False
    return True


def parse_questasim_coverage(report_dir, instance_path):
    """Pull the headline coverage numbers of one instance out of a Questa HTML
    report directory (the output of `vcover report -html`).

    Prefers files/overalldu.js under report_dir, which carries the aggregated
    numbers as structured data; falls back to scanning the HTML tables for a row naming
    the instance. Returns None when neither source yields anything."""
    # The JS file typically holds the overall summary data. `vcover report
    # -html -output <dir>` writes it as <dir>/files/overalldu.js; `make cov`
    # nests its own report one level deeper under cov_report/.
    js_file = next((candidate for candidate in (
        report_dir / "files" / "overalldu.js",
        report_dir / "cov_report" / "files" / "overalldu.js") if candidate.exists()),
        None)

    if js_file:
        try:
            content = js_file.read_text(errors='ignore')
            # The "ds" member of the embedded g_data object holds the overall
            # metrics, each as [total, covered, percentage]. It is followed by a
            # comma (more keys), never the ";" an earlier regex assumed -- and its
            # arrays only use brackets, so [^}]* safely bounds the object.
            ds_match = re.search(r'"ds":\s*(\{[^}]*\})', content)
            if ds_match:
                def get_val(key):
                    # Look for "s":[..., ..., value]
                    pattern = rf'"{key}":\s*\[\s*[^\]]*,\s*[^\]]*,\s*([\d\.]+)\s*\]'
                    match = re.search(pattern, ds_match.group(1))
                    return match.group(1) if match else "N/A"

                def get_single_val(key):
                    # Look for "tc":value
                    pattern = rf'"{key}":\s*([\d\.]+)'
                    match = re.search(pattern, ds_match.group(1))
                    return match.group(1) if match else "N/A"

                return {
                    "code_coverage": get_single_val("tc"),
                    "functional_coverage": get_val("fc"),
                    "statement": get_val("s"),
                    "branch": get_val("b"),
                    "fsm_state": get_val("fs"),
                    "fsm_transition": get_val("ft"),
                }
        except Exception as exc:
            print(f"Error parsing overalldu.js: {exc}")

    # Fallback to HTML parsing.
    paths_to_try = [instance_path, instance_path.lstrip('/')]

    try:
        for html_file in report_dir.rglob("*.html"):
            content = html_file.read_text(errors='ignore')
            for path in paths_to_try:
                if path in content:
                    rows = re.findall(r'<tr\b[^>]*>(.*?)</tr>', content,
                                      re.DOTALL | re.IGNORECASE)
                    for row in rows:
                        if path in row:
                            matches = re.findall(
                                r'<td\b[^>]*>\s*(\d+(?:\.\d+)?)\s*%?\s*</td>', row)
                            if not matches:
                                matches = re.findall(r'(\d+(?:\.\d+)?)\s*%', row)
                            if len(matches) >= 2:
                                return {"code_coverage": matches[0],
                                        "functional_coverage": matches[1]}
                            elif len(matches) == 1:
                                return {"code_coverage": matches[0],
                                        "functional_coverage": "N/A"}
    except Exception as exc:
        print(f"Error parsing coverage reports: {exc}")

    return None


def generate_coverage_reports(tb, cfg, results, timeout, clean=False):
    """Publish the full coverage-report artifact set from merged.ucdb and write
    sim/uvmt/test_results.log; returns (passed_count, total_count) as recorded in
    coverage_report/summary.json.

    results: this batch's (test, outcome, detail, gen_seed, run_seed) tuples, or
    None when nothing was executed (--report-only), in which case the pass/fail
    counts are recovered from an existing coverage_report/summary.json rather
    than reported as 0/0. Every coverage step is guarded on merged.ucdb actually
    existing, so a batch in which everything failed (or that never ran) still
    produces the dashboard plus summary.json, with N/A metrics.

    clean: wipe coverage_report/ first, so no artifact of a previous run survives
    into the published set."""
    tbcfg = TESTBENCHES[tb]
    sim_dir = tbcfg["sim_dir"]
    cov_instance = tbcfg["cov_instance"]
    report_dest_root = REPO / "coverage_report"
    log_file_abs = sim_dir / "test_results.log"
    merged_ucdb = sim_dir / "vsim_results" / cfg / "merged" / "merged.ucdb"
    summary_json_path = report_dest_root / "summary.json"

    # Pass/fail counts: from this batch, or recovered from the previous one.
    if results is None:
        prev = {}
        if summary_json_path.is_file():
            try:
                prev = json.loads(summary_json_path.read_text())
            except (OSError, ValueError) as exc:
                print(f"warning: could not read {summary_json_path}: {exc}")
        passed_count = prev.get("passed", 0)
        total_count = prev.get("total_tests", 0)
        log_lines = ["Tests skipped. Using recovered metrics from previous run."]
        print(f"Recovered previous test results: {passed_count}/{total_count} passed.")
    else:
        passed_count = sum(1 for r in results if r[1] == "PASS")
        total_count = len(results)
        status = {"PASS": "PASSED", "FAIL": "FAILED"}
        log_lines = [f"{test}: {status.get(outcome, outcome)}"
                     for test, outcome, _detail, _gen, _run in results]

    if clean and report_dest_root.exists():
        shutil.rmtree(report_dest_root)
        print(f"Removed previous report directory {report_dest_root}")
    report_dest_root.mkdir(parents=True, exist_ok=True)

    # Vendor-neutral formats: UCIS XML exported straight from the UCDB, then
    # Cobertura XML converted out of it (bin/ucdb_to_cobertura.py).
    ucis_xml_path = report_dest_root / "merged.ucis.xml"
    cobertura_path = report_dest_root / "cobertura.xml"
    if merged_ucdb.is_file():
        print("Generating vendor-neutral coverage formats ...")
        returncode, _, stderr = _run(["vcover", "report", "-xml", "-output",
                                      str(ucis_xml_path), str(merged_ucdb)],
                                     sim_dir, None, timeout, capture=True)
        if returncode != 0:
            print(f"  warning: failed to export UCIS XML: {(stderr or '').strip()}")
        elif generate_cobertura_xml(str(ucis_xml_path), str(cobertura_path),
                                    cov_instance):
            print(f"  Cobertura XML generated: {cobertura_path}")
        else:
            print("  warning: failed to generate Cobertura XML")
    else:
        print("warning: merged UCDB not found, vendor-neutral formats not generated")

    # Questa HTML report. `make cov` leaves it inside the sim tree; publish a
    # copy at the top level so GitHub Pages can serve it as-is.
    report_dest_questasim = report_dest_root / "questasim"
    if merged_ucdb.is_file():
        print(f"Generating HTML coverage report in {report_dest_questasim} ...")
        # -html takes no positional output directory (that is read as a second
        # ucdb); the scope/flags mirror `make cov`'s own vcover invocation.
        returncode, _, stderr = _run(["vcover", "report", "-html", "-details",
                                      "-precision", "2", "-annotate",
                                      f"-instance={cov_instance}.",
                                      "-output", str(report_dest_questasim),
                                      str(merged_ucdb)],
                                     sim_dir, None, timeout, capture=True)
        if returncode != 0:
            print(f"  warning: failed to generate HTML report: {(stderr or '').strip()}")
        else:
            print("  HTML report generated successfully")
    else:
        print("warning: merged UCDB not found, HTML report not generated")

    # Headline numbers for the core instance, read back out of the HTML report.
    cov_metrics = parse_questasim_coverage(report_dest_questasim, cov_instance)

    # Dashboard shell that reads summary.json; copied unconditionally so even a
    # run without coverage data publishes something browsable.
    dashboard_templates = REPO / "templates" / "coverage_dashboard"
    if (dashboard_templates / "index.html").is_file():
        shutil.copy(dashboard_templates / "index.html", report_dest_root / "index.html")
        shutil.copy(dashboard_templates / "style.css", report_dest_root / "style.css")
        print("Dashboard templates copied to coverage_report/")
    else:
        print(f"warning: dashboard templates not found at {dashboard_templates}/")

    # TRL5 metrics for the core instance. Taken from the HTML report's
    # overalldu.js (parse_questasim_coverage), which is already scoped to
    # cov_instance by the -instance flag above -- `vcover report -summary`
    # cannot provide a per-type breakdown for one instance, only a total.
    trl5_metrics = None
    if merged_ucdb.is_file():
        if cov_metrics:
            trl5_metrics = {
                "statement": cov_metrics.get("statement", "N/A"),
                "branch": cov_metrics.get("branch", "N/A"),
                "condition": cov_metrics.get("functional_coverage", "N/A"),
                "fsm_state": cov_metrics.get("fsm_state", "N/A"),
                "fsm_transition": cov_metrics.get("fsm_transition", "N/A"),
            }
            print("TRL5 coverage metrics extracted:")
            for key in ("statement", "branch", "condition", "fsm_state",
                        "fsm_transition"):
                print(f"  {key}: {trl5_metrics.get(key, 'N/A')}%")
        else:
            print("warning: failed to extract TRL5 coverage metrics")
    else:
        print("warning: merged UCDB file not found, TRL5 metrics not available")

    if trl5_metrics:
        trl5_json_path = report_dest_root / "trl5_metrics.json"
        trl5_json_path.write_text(json.dumps({
            "line_coverage": trl5_metrics.get("statement", "N/A"),
            "condition_coverage": trl5_metrics.get("condition", "N/A"),
            "branch_coverage": trl5_metrics.get("branch", "N/A"),
            "fsm_state_coverage": trl5_metrics.get("fsm_state", "N/A"),
            "fsm_transition_coverage": trl5_metrics.get("fsm_transition", "N/A"),
        }, indent=4))
        print(f"TRL5 coverage metrics saved to {trl5_json_path}")

    # sim/uvmt/test_results.log: plain-text pass/fail list, kept for continuity
    # with the artifacts previous CI iterations published.
    pass_rate = (passed_count / total_count * 100) if total_count else 0
    with open(log_file_abs, "w") as f:
        f.write("UVM Test Results\n================\n")
        for line in log_lines:
            f.write(line + "\n")
        f.write(f"\nSummary: {passed_count}/{total_count} tests passed "
                f"({pass_rate:.2f}%).\n")
    print(f"Results saved to {log_file_abs}")

    # summary.json drives the dashboard's cards and its TRL badge.
    summary_data = {
        "code_coverage": cov_metrics.get("code_coverage", "N/A") if cov_metrics else "N/A",
        # The dashboard's Functional Coverage card is sourced from Questa Sim's
        # own functional-cover metric (overalldu.js 'fc'), not the test pass rate.
        "functional_coverage": cov_metrics.get("functional_coverage", "N/A") if cov_metrics else "N/A",
        "pass_rate": round(pass_rate, 2),
        "total_tests": total_count,
        "passed": passed_count,
        "failed": total_count - passed_count,
    }
    # trl5_metrics is derived from cov_metrics above, so the two are consistent;
    # without a merged .ucdb there are no numbers and everything stays N/A.
    if trl5_metrics:
        summary_data.update({
            "line_coverage": trl5_metrics.get("statement", "N/A"),
            "condition_coverage": trl5_metrics.get("condition", "N/A"),
            "branch_coverage": trl5_metrics.get("branch", "N/A"),
            "fsm_state_coverage": trl5_metrics.get("fsm_state", "N/A"),
            "fsm_transition_coverage": trl5_metrics.get("fsm_transition", "N/A"),
        })
    else:
        summary_data.update({
            "line_coverage": "N/A",
            "condition_coverage": "N/A",
            "branch_coverage": "N/A",
            "fsm_state_coverage": "N/A",
            "fsm_transition_coverage": "N/A",
        })
    summary_json_path.write_text(json.dumps(summary_data, indent=4))
    print(f"Summary metrics saved to {summary_json_path}")

    return passed_count, total_count


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("tests", nargs="*",
                    help="specific test names to run (default: the full cleaned-up set)")
    ap.add_argument("--tb", choices=sorted(TESTBENCHES), default="core",
                    help="testbench to run on: 'core' (Verilator) or 'uvmt' (vsim) "
                         "(default: core)")
    ap.add_argument("--include-parked", action="store_true",
                    help="also run the parked tests (step-compare arithmetic/CSR and "
                         "debug variants; meaningful under --tb uvmt)")
    ap.add_argument("--include-corev-dv", action="store_true",
                    help="also run the passing corev-dv generated regression tests "
                         "(uvmt only; each needs an extra gen_corev-dv step)")
    ap.add_argument("--corev-dv-only", action="store_true",
                    help="run ONLY the corev-dv generated regression tests (uvmt "
                         "only); cannot be combined with test names, "
                         "--include-parked, or --include-corev-dv")
    ap.add_argument("--parse-only", action="store_true",
                    help="do not run; just parse existing logs in the results directory")
    ap.add_argument("--cfg", default="default",
                    help="uvmt config subdirectory under vsim_results (default: default)")
    ap.add_argument("--run-index", type=int, default=0,
                    help="RUN_INDEX subdirectory to use (default: 0)")
    ap.add_argument("--timeout", type=int, default=1800,
                    help="per-test timeout in seconds (default: 1800; the "
                         "interrupt-heavy corev-dv templates routinely take "
                         "10-15 minutes including compile)")
    ap.add_argument("--gen-seed", default="random",
                    help="SEED for the corev-dv generation step (gen_corev-dv; "
                         "the random-instruction-stream generator). 'random' "
                         "(default) or a literal value to replay a specific "
                         "prior run -- see --run-seed, a fully independent "
                         "knob (gen_corev-dv and test are separate UVM "
                         "environments/vsim invocations, each seeded "
                         "separately). No effect on non-corev-dv tests.")
    ap.add_argument("--run-seed", default="random",
                    help="SEED for the test step (the actual firmware run's "
                         "env-level randomization, e.g. OBI stall knobs). "
                         "'random' (default) or a literal value to replay a "
                         "specific prior run. No effect on non-corev-dv tests.")
    ap.add_argument("--cov", action="store_true",
                    help="collect code coverage (uvmt only; equivalent to "
                         "`make test ... COV=1` per test). Requires "
                         "sim/tools/vsim/cov.tcl to exist, or Questa silently "
                         "collects nothing -- see docs/COVERAGE-MAKE-TARGETS.md "
                         "for the report targets (cov, cov_txt, cov_holes, "
                         "cov_holes_details) that consume the resulting .ucdb.")
    ap.add_argument("--cov-report", action="store_true",
                    help="implies --cov, and additionally merges each PASSing test's "
                         ".ucdb into vsim_results/<cfg>/merged/merged.ucdb and "
                         "publishes the full report artifact set under "
                         "coverage_report/ (uvmt only; requires --tb uvmt). Tests that "
                         "did not PASS are not merged -- see --merge-existing.")
    ap.add_argument("--all-custom", action="store_true",
                    help="select every directory under TESTS_ROOTS (tests/programs/custom) "
                         "instead of the curated lists. PARKED and corev-dv names are "
                         "skipped unless --include-parked / --include-corev-dv also ask "
                         "for them, and DISCOVERY_EXCLUDES is always skipped. Cannot be "
                         "combined with test names or --corev-dv-only")
    ap.add_argument("--merge-existing", action="store_true",
                    help="run no simulation: merge every selected test that already has "
                         "a .ucdb on disk (verdicts re-parsed from their existing logs, "
                         "as with --parse-only), then regenerate the reports (uvmt only)")
    ap.add_argument("--report-only", action="store_true",
                    help="run nothing and merge nothing: regenerate coverage_report/ "
                         "from the merged .ucdb already on disk, recovering the "
                         "pass/fail counts from the previous summary.json (uvmt only). "
                         "Always exits 0 -- no test was run to gate on.")
    ap.add_argument("--clean-report", action="store_true",
                    help="delete coverage_report/ before regenerating it (a --cov-report "
                         "run wipes it, and the merged .ucdb, on its own)")
    ap.add_argument("--quiet", action="store_true",
                    help="suppress per-test simulation banner output")
    ap.add_argument("--jobs", "-j", type=int, default=1,
                    help="run up to N tests concurrently (default: 1, sequential). "
                         "See the 'Concurrency' section of --help for the safety "
                         "model (uvmt only is verified race-free; core is not).")
    args = ap.parse_args()

    if args.jobs < 1:
        ap.error("--jobs must be >= 1")

    if args.cov and args.tb != "uvmt":
        ap.error("--cov requires --tb uvmt (Questa coverage; the core "
                  "Verilator testbench has no COV support)")

    # The merge/report pipeline is Questa- and therefore uvmt-only throughout.
    cov_pipeline = args.cov_report or args.merge_existing or args.report_only
    if cov_pipeline and args.tb != "uvmt":
        ap.error("--cov-report/--merge-existing/--report-only require --tb uvmt "
                  "(Questa coverage data; the core Verilator testbench writes no "
                  ".ucdb and has no vcover to merge it with)")
    if args.cov_report:
        # Collecting the per-test .ucdb files is a precondition of merging them.
        args.cov = True
    if args.report_only and (args.parse_only or args.merge_existing):
        ap.error("--report-only cannot be combined with --parse-only or "
                  "--merge-existing (--report-only neither runs nor merges)")
    if args.all_custom and (args.tests or args.corev_dv_only):
        ap.error("--all-custom cannot be combined with test names or --corev-dv-only")
    # Neither of these launches a simulation.
    no_exec = args.merge_existing or args.report_only

    if args.corev_dv_only:
        if args.tests or args.include_parked or args.include_corev_dv:
            ap.error("--corev-dv-only cannot be combined with test names, "
                      "--include-parked, or --include-corev-dv")
        selected = list(COREV_DV_TESTS)
    elif args.all_custom:
        selected = discover_all_custom()
        if args.include_parked:
            selected += PARKED
        if args.include_corev_dv:
            selected += COREV_DV_TESTS
    elif args.tests:
        selected = args.tests
    else:
        selected = list(TESTS)
        if args.tb == "uvmt":
            selected += UVMT_TESTS
        if args.include_parked:
            selected += PARKED
        if args.include_corev_dv:
            selected += COREV_DV_TESTS

    if not selected:
        # --all-custom on an empty/missing TESTS_ROOTS would otherwise blow up on
        # the summary-table width computation below.
        sys.exit("error: no tests selected")

    sim_dir = TESTBENCHES[args.tb]["sim_dir"]
    if not sim_dir.is_dir():
        sys.exit(f"error: sim directory for --tb {args.tb} not found at {sim_dir}")

    # A --cov-report regression starts from a clean slate: merged.ucdb is keyed
    # on *every* .ucdb mk/uvmt/vsim.mk finds under the cfg, so leftover per-test
    # data from earlier runs would otherwise leak into the published numbers.
    clean_report = args.clean_report
    if args.cov_report and not no_exec:
        merged_dir = sim_dir / "vsim_results" / args.cfg / "merged"
        if merged_dir.exists():
            shutil.rmtree(merged_dir)
            print(f"Removed stale merged coverage directory {merged_dir}")
        clean_report = True

    if args.report_only:
        passed, total_ran = generate_coverage_reports(
            args.tb, args.cfg, None, args.timeout, clean=clean_report)
        print(f"\n{passed}/{total_ran} test(s) passed in the run these "
              "reports describe")
        # Nothing was executed here, so there is nothing to gate on.
        sys.exit(0)

    needs_corev_dv = any(test in COREV_DV_TESTS for test in selected)
    if needs_corev_dv and not (args.parse_only or no_exec):
        if args.tb != "uvmt":
            sys.exit("error: corev-dv tests require --tb uvmt")
        setup_corev_dv(args.tb, args.timeout)

    extra_make_args = []
    if args.jobs > 1 and not (args.parse_only or no_exec):
        if args.tb == "uvmt":
            # One-time serialized compile so the parallel batch below can pass
            # COMP=NO and safely skip recompilation instead of racing on the
            # shared vsim work library -- see the "Concurrency" section of
            # --help for the full explanation.
            setup_comp(args.tb, args.timeout, cov=args.cov)
            extra_make_args = ["COMP=NO"]
        else:
            print(f"warning: --jobs {args.jobs} with --tb core has not been "
                  "verified race-free against the shared Verilator build "
                  "directory (sim/core/cobj_dir); proceeding anyway, but "
                  "prefer --jobs 1 unless you've confirmed it's safe.")

    def run_one(test):
        # --merge-existing contributes to the merge only; verdicts still come
        # from the logs of whatever ran before.
        just_parse = args.parse_only or args.merge_existing
        action = "Parsing" if just_parse else "Running"
        with _print_lock:
            print(f"[{action}/{args.tb}] {test} ...")
        if just_parse:
            outcome, detail, gen_seed, run_seed = parse_only(
                args.tb, test, args.run_index, args.cfg)
        else:
            outcome, detail, gen_seed, run_seed = run_test(
                args.tb, test, args.run_index, args.cfg,
                args.timeout, args.quiet,
                extra_make_args=extra_make_args,
                label=test if args.jobs > 1 else None,
                gen_seed=args.gen_seed, run_seed=args.run_seed,
                cov=args.cov)

        # Feed this test's .ucdb into the merged database straight away. A
        # --cov-report batch only contributes PASSing runs (a FAILED/ERROR run
        # may have no .ucdb at all, or a truncated one); --merge-existing takes
        # whatever is on disk regardless of verdict, which is exactly what it's
        # for. merge_test_coverage() skips tests without a .ucdb either way.
        if args.cov_report or args.merge_existing:
            if outcome == "PASS" or args.merge_existing:
                if merge_test_coverage(args.tb, test, args.run_index, args.cfg,
                                       args.timeout):
                    with _print_lock:
                        print(f"[Merged/{args.tb}] {test}")

        if args.jobs > 1:
            done = "Parsed" if just_parse else "Done"
            with _print_lock:
                print(f"[{done}/{args.tb}] {test}: {outcome} {detail}".rstrip())
        return test, outcome, detail, gen_seed, run_seed

    width = max(len(t) for t in selected)
    if args.jobs == 1:
        results = [run_one(test) for test in selected]
    else:
        outcomes = {}
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
            futures = [pool.submit(run_one, test) for test in selected]
            for future in concurrent.futures.as_completed(futures):
                test, outcome, detail, gen_seed, run_seed = future.result()
                outcomes[test] = (test, outcome, detail, gen_seed, run_seed)
        # Report in the original --selected order regardless of completion order.
        results = [outcomes[test] for test in selected]

    # Summary. GEN_SEED/RUN_SEED are "-" for non-corev-dv tests (no generation
    # step, no explicit SEED given) -- see run_test()'s docstring for why the
    # two are tracked independently rather than as a single seed.
    def _fmt_seed(s):
        return s if s is not None else "-"

    gen_width = max([len("GEN_SEED")] + [len(_fmt_seed(r[3])) for r in results])
    run_width = max([len("RUN_SEED")] + [len(_fmt_seed(r[4])) for r in results])
    header = (f"{'TEST'.ljust(width)}   RESULT   "
              f"{'GEN_SEED'.ljust(gen_width)}   {'RUN_SEED'.ljust(run_width)}   DETAIL")
    sep_width = len(header)

    print()
    print("=" * sep_width)
    print(f"testbench: {args.tb}")
    print("-" * sep_width)
    print(header)
    print("-" * sep_width)
    counts = {"PASS": 0, "FAIL": 0, "ERROR": 0}
    for test, outcome, detail, gen_seed, run_seed in results:
        counts[outcome] = counts.get(outcome, 0) + 1
        print(f"{test.ljust(width)}   {outcome:<6}   "
              f"{_fmt_seed(gen_seed).ljust(gen_width)}   "
              f"{_fmt_seed(run_seed).ljust(run_width)}   {detail}")
    print("=" * sep_width)
    total = len(results)
    print(f"{total} test(s): {counts['PASS']} passed, "
          f"{counts['FAIL']} failed, {counts['ERROR']} error(s)")

    # Reports last, so a coverage run publishes exactly what this batch scored.
    if cov_pipeline:
        print()
        generate_coverage_reports(args.tb, args.cfg, results, args.timeout,
                                  clean=clean_report)

    # Exit non-zero unless everything ran and passed -- which is also what makes
    # a --cov-report batch usable as the CI gate.
    sys.exit(0 if counts["PASS"] == total else 1)


if __name__ == "__main__":
    main()
