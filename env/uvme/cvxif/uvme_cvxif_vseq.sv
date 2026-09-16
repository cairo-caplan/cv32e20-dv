// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local stub: this file is `included by the vendored uvma_cvxif_pkg.sv
// (see src/uvma_cvxif_pkg.sv) but is NOT shipped in the vendor tree.  It is
// provided here so the vendored package compiles unmodified.  The real slave
// response sequence (uvme_cvxif_basic_seq_c) extends this virtual sequence.

`ifndef __UVME_CVXIF_VSEQ_SV__
`define __UVME_CVXIF_VSEQ_SV__

/**
 * Top-level virtual sequence for the CV-X-IF agent.
 */
class uvme_cvxif_vseq_c extends uvme_cvxif_base_vseq_c;

   `uvm_object_utils(uvme_cvxif_vseq_c)

   extern function new(string name="uvme_cvxif_vseq");

   extern virtual task body();

endclass : uvme_cvxif_vseq_c


function uvme_cvxif_vseq_c::new(string name="uvme_cvxif_vseq");

   super.new(name);

endfunction : new


task uvme_cvxif_vseq_c::body();

   `uvm_info("CVXIF_VSEQ", "Top-level virtual sequence body (default no-op)", UVM_HIGH)
   // Intentional no-op: derived sequences override body().

endtask : body

`endif // __UVME_CVXIF_VSEQ_SV__
