// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local derived context class for the CV-X-IF agent.
// Extends the (unmodified) vendored uvma_cvxif_cntxt_c.

`ifndef __UVME_CVXIF_CNTXT_C_SV__
`define __UVME_CVXIF_CNTXT_C_SV__

/**
 * CV32E20-specific CV-X-IF agent context.
 */
class uvme_cvxif_cntxt_c extends uvma_cvxif_cntxt_c;

   `uvm_object_utils(uvme_cvxif_cntxt_c)

   extern function new(string name="uvme_cvxif_cntxt");

endclass : uvme_cvxif_cntxt_c


function uvme_cvxif_cntxt_c::new(string name="uvme_cvxif_cntxt");

   super.new(name);

endfunction : new

`endif // __UVME_CVXIF_CNTXT_C_SV__
