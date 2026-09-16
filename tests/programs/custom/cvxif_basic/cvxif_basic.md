# CV-X-IF `cvxif_basic` Test

This document describes the directed
`cvxif_basic` UVM/firmware test that exercises the OpenHW's eXtension InterFace (CV-X-IF) coprocessor-slave
interface on the CVE2 on its CV32E20X configuration.

## Purpose

`cvxif_basic` is a **directed** test of the **CORE-V eXtension Interface
(CV-X-IF)** coprocessor-slave interface. The firmware
(`tests/programs/custom/cvxif_basic/cvxif_basic.c`) issues a `CUS-ADD`
instruction (custom opcode `0x7B`, funct3=0, funct7=0). The CVE2 core decodes
the unrecognised opcode as an illegal instruction and, because the
coprocessor interface is enabled, issues it to the CV-X-IF slave. The
fork-local UVM slave agent computes `rs1 + rs2` and writes the result back to
`rd`; the firmware then checks `result == rs1 + rs2` and, on the shipped
operands (`rs1=8`, `rs2=9`, sum `17`), prints
`SUCCESS: CUS-ADD result = 17 (expected 17)` and
`TEST PASSED WITH CODE 123456789`.

## Core-configuration restriction

This test **only runs on the CV32E20X core configuration**, i.e.
`CVE2_CONFIG=CV32E20X`, the CVE2 configuration with the **CORE-V eXtension
Interface** enabled (`+define+CVE2_XIF_ENABLE`). On the plain **CV32E20**
configuration (`CVE2_CONFIG=CV32E20`, the default) the CV-X-IF is disabled and
this test is **neither built nor run**.

The gate chain is:

1. `mk/uvmt/uvmt.mk`: when `CVE2_CONFIG=CV32E20X`, it adds
   `+define+CVE2_XIF_ENABLE` to `SV_CMP_FLAGS` (see `mk/uvmt/uvmt.mk:83,89`).
   `CVE2_CONFIG` defaults to `CV32E20` and is validated to be either
   `CV32E20` or `CV32E20X`.
2. `tb/uvmt/uvmt_cv32e20_tb.sv`: `` `ifdef CVE2_XIF_ENABLE `` sets the
   `DUT_WRAP_XINTERFACE` parameter to `1'b1` (default `1'b0`) and, in
   `config_db` setup, sets `xif_enabled=1'b1` and makes the `cvx_if` virtual
   interface handle available to `*.env.cvxif_agent`
   (see `tb/uvmt/uvmt_cv32e20_tb.sv:50-53,154,373`).
3. `tb/uvmt/uvmt_cv32e20_dut_wrap.sv`: the `if (XInterface) begin :
   gen_cvxif` generate block wires the CV-X-IF channels between the core and
   the `cvx_if` interface (see `tb/uvmt/uvmt_cv32e20_dut_wrap.sv:227`).
4. `tests/uvmt/firmware-tests/uvmt_cv32e20_general_purpose_test.sv`: the
   `cvxif_basic()` task (which forks `uvme_cvxif_basic_seq_c` on
   `vsequencer.cvxif_sequencer`) and its `fork … join_none` launch in
   `run_phase` are both guarded by `` `ifdef CVE2_XIF_ENABLE ``
   (see `tests/uvmt/firmware-tests/uvmt_cv32e20_general_purpose_test.sv:79-84,147-151,262-271`).

## How to run

The test requires the CV32E20X configuration and has been tested without an ISS and only using Siemens EDA's Questa Sim as simulator so far. To test it, you need to execute the following commands:

```bash
cd sim/uvmt
make test TEST=cvxif_basic SIMULATOR=vsim CVE2_CONFIG=CV32E20X USE_ISS=NO
```

## Architecture

The test reuses the vendored `uvma_cvxif_*` library (compiled unmodified from
`vendor_lib/.../uvma_cvxif_pkg`) and layers fork-local derived classes on top
(`env/uvme/cvxif/`):

- **`uvme_cvxif_agent_c`** : extends the vendored agent; registers factory
  overrides so the vendored `create_components()` resolves the fork-local
  driver/monitor, and provides fork-local `cfg`/`cntxt` defaults.
- **`uvme_cvxif_drv_c`** : holds `issue_ready` LOW until a full response
  (`accept=1`, `writeback=1`) is presented, then raises it, so the core always
  samples `accept==1` at the handshake (the core's illegal-instruction decode
  is combinational on `issue_valid & issue_ready & ~accept`). It also avoids
  driving the core-owned interface signals (owned by the DUT wrapper).
- **`uvme_cvxif_mon_c`** : captures the register channel alongside each issue
  transaction (the core does not pulse `register_valid`). Two issues were fixed
  versus the vendored monitor: (a) the vendored
  `collect_and_send_req`/`collect_and_send_resp` are **non-virtual**, so the
  base `mon_cvxif_post_reset` statically binds to the base
  `collect_and_send_req` : the override re-forks the derived collector from the
  virtual `mon_cvxif_post_reset` entry point; (b) the monitoring loop consumes
  at least one clock per iteration to avoid a **zero-delay spin** (a bare
  `while (!issue_valid) @(posedge clk)` guard falls through with zero delay
  once both `issue_valid` and `issue_ready` are high).
- **`uvme_cvxif_basic_seq_c`** : accepts every issue request, reads `rs1`/`rs2`
  and returns a writeback whose data is `rs1 + rs2`.
- **`uvme_cvxif_cfg_c`** : soft-pins deterministic, single-slave, pass-through
  knobs for the directed test.

The core (`cve2_pkg`) and the vendored agent (`uvma_cvxif_pkg`) declare the
same-named CV-X-IF packed structs with **different field widths** (core:
`X_ID_WIDTH=4`, `X_NUM_RS=3`; vendored: `X_ID_WIDTH=3`, `X_NUM_RS=2`). A raw
bit-cast between the two reinterprets the bits (the slave's `accept` bit lands
in the wrong position of the core's wider struct), which made the core sample
`issue_resp.accept==0` and raise an illegal instruction. The `gen_cvxif`
generate block in `uvmt_cv32e20_dut_wrap.sv` therefore maps the interface
**field-by-field** so widths are always honoured.

## Files

- `env/uvme/cvxif/*` : fork-local derived agent/driver/monitor/sequence/cfg
  classes and the `uvme_cvxif_pkg` package + `uvme_cvxif_pkg.flist` compile
  list.
- `tb/uvmt/uvmt_cv32e20_tb.sv` : `CVE2_XIF_ENABLE`-guarded `DUT_WRAP_XINTERFACE`
  / `xif_enabled` and `cvx_if` config_db wiring.
- `tb/uvmt/uvmt_cv32e20_dut_wrap.sv` : `gen_cvxif` generate block (field-by-field
  interface mapping).
- `tests/uvmt/firmware-tests/uvmt_cv32e20_general_purpose_test.sv` :
  `CVE2_XIF_ENABLE`-guarded `cvxif_basic()` task.
- `tests/programs/custom/cvxif_basic/cvxif_basic.c` : firmware issuing
  `CUS-ADD`; `tests/programs/custom/cvxif_basic/test.yaml` : test metadata.
