// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local derived configuration class for the CV-X-IF agent.
// Extends the (unmodified) vendored uvma_cvxif_cfg_c and pins the CV32E20
// defaults for the basic coprocessor-slave directed test.

`ifndef __UVME_CVXIF_CFG_C_SV__
`define __UVME_CVXIF_CFG_C_SV__

/**
 * CV32E20-specific CV-X-IF agent configuration.
 */
class uvme_cvxif_cfg_c extends uvma_cvxif_cfg_c;

   `uvm_object_utils(uvme_cvxif_cfg_c)

   extern function new(string name="uvme_cvxif_cfg");

   /**
    * Constrain to a deterministic, single-slave, pass-through builder:
    * accept every issue, read rs1/rs2, write back the result.  All knobs are
    * pinned so the directed firmware test produces deterministic transactions.
    */
   // These must be "soft": the vendored uvma_cvxif_cfg_c::defaults_val
   // constraint already soft-pins the same members (e.g. enabled_cvxif == 0).
   // Declaring these hard made randomize() unsolvable (soft enabled_cvxif==0
   // vs. hard enabled_cvxif==1), and since the env calls
   // void'(cvxif_cfg.randomize()), the failed randomize left every rand var
   // at its 0/default value -- so enabled_cvxif stayed 0 and the driver
   // rejected all CPU requests.  As soft constraints, the derived-class
   // values take priority over the base defaults and randomize() succeeds.
   constraint cv32e20_basic_cons {
      soft enabled_cvxif          == 1;
      soft cov_model_enabled      == 0;
      soft issue_ready_mode       == UVMA_CVXIF_ISSUE_READY_FIX;
      soft compressed_ready_mode  == UVMA_CVXIF_COMPRESSED_READY_FIX;
      soft ordering_mode          == UVMA_CVXIF_ORDERING_MODE_IN_ORDER;
      soft zero_delay_mode        == 1;
      soft instr_delayed          == 0;
   }

endclass : uvme_cvxif_cfg_c


function uvme_cvxif_cfg_c::new(string name="uvme_cvxif_cfg");

   super.new(name);

endfunction : new

`endif // __UVME_CVXIF_CFG_C_SV__
