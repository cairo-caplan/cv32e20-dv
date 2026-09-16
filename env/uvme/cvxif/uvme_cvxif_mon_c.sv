// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local derived monitor class for the CV-X-IF coprocessor slave.
// The vendored uvma_cvxif_mon_c::collect_and_send_req only samples the
// register channel when cntxt.vif.register_valid is asserted.  The CVE2 core
// does not drive register_valid on the interface (it drives the register
// payload alongside the issue_request as a combinational companion of the
// issue_valid).  This subclass overrides collect_and_send_req to capture the
// register data whenever an issue transaction is observed, avoiding a lost
// sample.  All other behaviour is inherited from the vendor monitor.

`ifndef __UVME_CVXIF_MON_C_SV__
`define __UVME_CVXIF_MON_C_SV__

/**
 * CV32E20-specific CV-X-IF monitor.
 */
class uvme_cvxif_mon_c extends uvma_cvxif_mon_c;

   `uvm_component_utils(uvme_cvxif_mon_c)
 
   extern function new(string name="uvme_cvxif_mon", uvm_component parent=null);

   /**
    * Collect and send request items; captures the register channel alongside
    * the issue transaction (CVE2 does not pulse register_valid).
    */
   extern virtual task collect_and_send_req(uvma_cvxif_req_item_c req_tr);

   /**
    * Post-reset monitoring loop.  The vendored base-class methods
    * collect_and_send_req / collect_and_send_resp are declared NON-virtual,
    * so the base mon_cvxif_post_reset statically binds to the BASE
    * collect_and_send_req (which waits on the slv_cvxif_cb clocking-block
    * event and on issue_valid && issue_ready together) and the derived
    * override above never runs.  Override this virtual entry point to fork
    * the derived collect_and_send_req (statically bound here, inside the
    * derived class) alongside the inherited collect_and_send_resp.
    */
   extern virtual task mon_cvxif_post_reset();

   endclass : uvme_cvxif_mon_c


function uvme_cvxif_mon_c::new(string name="uvme_cvxif_mon", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


task uvme_cvxif_mon_c::collect_and_send_req(uvma_cvxif_req_item_c req_tr);

   forever begin
      // Wait for the core to raise an issue request.  Trigger on issue_valid
      // ALONE (not issue_valid && issue_ready): the CVE2 core holds
      // issue_valid (and the register channel) asserted while the slave keeps
      // issue_ready low, so detecting the rise lets the response (accept=1)
      // be prepared before the driver raises issue_ready -- the core then
      // never samples accept==0 at the handshake (cve2_id_stage
      // illegal_insn_o = ... & ~x_issue_resp_i.accept).
      // NOTE: wait on the raw posedge-clk event, NOT on the interface's
      // slv_cvxif_cb clocking block: that cb is declared with event
      // "@(posedge clk or reset_n)" and its event never triggers through
      // the virtual-interface handle in this environment, which left this
      // loop (and the whole monitor -> sequence -> driver round trip)
      // permanently blocked while the core held issue_valid high.
      // Consume at least one clock per iteration: a bare
      // "while (!issue_valid) @(posedge clk)" guard falls through with zero
      // delay once both issue_valid and issue_ready are high, which spun this
      // loop (and the whole monitor -> sequence -> driver round trip) at a
      // single timestamp.
      do @(posedge cntxt.vif.clk);
      while (!cntxt.vif.issue_valid);
      `uvm_info(info_tag, "issue_valid observed high", UVM_HIGH)

      req_tr = uvma_cvxif_req_item_c::type_id::create("req_tr");
      `uvm_info(info_tag, $sformatf("New transaction received"), UVM_HIGH);

      req_tr.issue_valid         = cntxt.vif.issue_valid;
      req_tr.issue_req.instr     = cntxt.vif.issue_req.instr;
      req_tr.issue_req.hartid    = cntxt.vif.issue_req.hartid;
      req_tr.issue_req.id        = cntxt.vif.issue_req.id;

      // Sample the register channel as a companion of the issue transaction.
      // The CVE2 core presents register data in the same cycle as the issue
      // request; it does not pulse register_valid on the interface.
      req_tr.register_valid     = 1'b1;
      req_tr.register.hartid    = cntxt.vif.register.hartid;
      req_tr.register.id        = cntxt.vif.register.id;
      for (int i = 0; i < X_NUM_RS; i++) begin
        req_tr.register.rs_valid[i]  = cntxt.vif.register.rs_valid[i];
        req_tr.register.rs[i]        = cntxt.vif.register.rs[i];
      end

      `uvm_info(info_tag, $sformatf("Sending req to sqr %p", req_tr), UVM_HIGH);
      send_req_to_sqr(req_tr);

      // Wait for the issue handshake, then for the core to drop issue_valid,
      // so this request is handled exactly once and every iteration of this
      // loop consumes simulation time (the core holds issue_valid through the
      // whole result phase, so re-checking the handshake at zero delay after
      // it completes spun this loop forever at one timestamp).
      do @(posedge cntxt.vif.clk);
      while (!(cntxt.vif.issue_valid && cntxt.vif.issue_ready));
      `uvm_info(info_tag, "issue handshake observed complete", UVM_HIGH)

      do @(posedge cntxt.vif.clk);
      while (cntxt.vif.issue_valid);
      end

endtask : collect_and_send_req


task uvme_cvxif_mon_c::mon_cvxif_post_reset();

   fork
      collect_and_send_resp(resp_tr);
      collect_and_send_req(req_tr);
   join_any

endtask : mon_cvxif_post_reset

`endif // __UVME_CVXIF_MON_C_SV__
