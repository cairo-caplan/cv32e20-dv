// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local package for the CV-X-IF coprocessor-slave agent used by the
// CV32E20X (CVE2_CONFIG=CV32E20X) configuration.  The vendored
// uvma_cvxif_pkg is compiled unmodified as the base-class library; this
// package defines the fork-local derived classes that inherit from it.
//
// Usage constraints:
//   * Compile ${DV_UVMA_CVXIF_PATH}/src/uvma_cvxif_pkg.flist FIRST (it pulls
//     in the stub uvme_cvxif_base_vseq.sv / uvme_cvxif_vseq.sv via +incdir)
//     so derived classes can import uvma_cvxif_pkg below.
//   * Gated by CVE2_XIF_ENABLE; the default CV32E20 flow is unaffected.

`ifndef __UVME_CVXIF_PKG_SV__
`define __UVME_CVXIF_PKG_SV__

// Pre-processor macros
`include "uvm_macros.svh"

/**
 * Encapsulates the fork-local CV-X-IF derived types.
 */
package uvme_cvxif_pkg;

   import uvm_pkg       ::*;

   // Only import uvma_cvxif_pkg.  Importing cve2_pkg::* as well made the
   // identifier X_NUM_RS ambiguous (it is wildcard-imported from BOTH
   // uvma_cvxif_pkg (=2) and cve2_pkg (=3)); per the LRM a name wildcard-
   // imported from two packages is NOT resolved by import order, so every
   // use of bare X_NUM_RS (e.g. uvme_cvxif_mon_c.sv) failed to compile,
   // which cascaded into uvme_cv32e20_pkg / uvmt_cv32e20_pkg not compiling.
   // No fork-local file references a cve2_pkg symbol, so this import is
   // removed entirely; bare X_NUM_RS now resolves unambiguously to
   // uvma_cvxif_pkg::X_NUM_RS (=2), matching the vendored struct widths.
   import uvma_cvxif_pkg::*;

   // Objects
   `include "uvme_cvxif_cfg_c.sv"
   `include "uvme_cvxif_cntxt_c.sv"
   `include "uvme_cvxif_basic_seq_c.sv"
   `include "uvme_cvxif_drv_c.sv"
   `include "uvme_cvxif_mon_c.sv"
   `include "uvme_cvxif_agent_c.sv"

endpackage : uvme_cvxif_pkg

`endif // __UVME_CVXIF_PKG_SV__
