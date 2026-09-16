// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local derived driver class for the CV-X-IF coprocessor slave.
//
// The CVE2 core samples issue_resp.accept COMBINATIONALLY at the cycle it
// drives issue_valid & issue_ready high (cve2_id_stage.sv:
//   illegal_insn_o = instr_valid_i & (... | (x_issue_valid_o &
//                     x_issue_ready_i & ~x_issue_resp_i.accept))).
// The vendored driver drives issue_ready high from reset (FIX mode) but only
// drives accept reactively (after the monitor -> sequence -> driver
// round-trip), so the core sampled accept==0 at the handshake and raised an
// illegal instruction.  Here issue_ready is held LOW until a response
// (accept=1, writeback=1) has been presented, then raised so the core always
// samples accept==1 at the handshake.  The core holds issue_valid (and the
// register channel) while issue_ready is low, so nothing is lost.  The
// writeback result is queued immediately (the core holds issue_valid until it
// receives the result, so waiting here would deadlock); the inherited
// drv_result_in_order process drives it once the core is result-ready.
//
// reset_phase additionally avoids driving the core-owned interface signals
// (issue_valid, register_valid, commit_valid, compressed_valid) which the DUT
// owns (uvmt_cv32e20_dut_wrap.sv), preventing a multiple-driver conflict.

`ifndef __UVME_CVXIF_DRV_C_SV__
`define __UVME_CVXIF_DRV_C_SV__

/**
 * CV32E20-specific CV-X-IF driver.
 */
class uvme_cvxif_drv_c extends uvma_cvxif_drv_c;

   `uvm_component_utils(uvme_cvxif_drv_c)

   extern function new(string name="uvme_cvxif_drv", uvm_component parent=null);

   /**
    * Reset_phase override: de-assert only the slave-owned signals.
    */
   extern virtual task reset_phase(uvm_phase phase);

   /**
    * Hold issue_ready low until a response is prepared (see file header).
    */
   extern virtual task gen_slv_random_ready();

   /**
    * Present the coprocessor response, then raise issue_ready so the core
    * accepts the issue with accept/writeback already high, and queue the
    * writeback result for driving once the core is ready.
    */
   extern virtual task drv_slv_resp(uvma_cvxif_pkg::uvma_cvxif_resp_item_c item);

endclass : uvme_cvxif_drv_c


function uvme_cvxif_drv_c::new(string name="uvme_cvxif_drv", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


task uvme_cvxif_drv_c::reset_phase(uvm_phase phase);

   // Slave-owned signals only (core-owned signals are driven by the DUT).
   cntxt.vif.issue_ready              <= 1'b0;
   cntxt.vif.issue_resp.accept        <= 1'b0;
   cntxt.vif.issue_resp.writeback     <= '0;
   cntxt.vif.issue_resp.register_read <= '0;
   cntxt.vif.compressed_ready         <= 1'b0;
   cntxt.vif.compressed_resp.accept   <= 1'b0;
   cntxt.vif.compressed_resp.instr    <= '0;
   cntxt.vif.result_valid             <= 1'b0;
   cntxt.vif.result                   <= '0;

endtask : reset_phase


// Hold issue_ready low: the core holds issue_valid (and the register channel)
// while issue_ready is low, and its illegal-instruction decode is
// combinational on (issue_valid & issue_ready & ~accept).  drv_slv_resp raises
// issue_ready only after accept/writeback are presented, so the core never
// samples accept==0 at the handshake.
task uvme_cvxif_drv_c::gen_slv_random_ready();

   if (cfg.issue_ready_mode == UVMA_CVXIF_ISSUE_READY_FIX) begin
      // Never assert issue_ready here; drv_slv_resp owns it.
      forever @(posedge cntxt.vif.clk);
   end
   else begin
      super.gen_slv_random_ready();
   end

endtask : gen_slv_random_ready


task uvme_cvxif_drv_c::drv_slv_resp(uvma_cvxif_pkg::uvma_cvxif_resp_item_c item);

   if (item.issue_valid) begin
      // Present the response (accept=1, writeback, register_read) first, so
      // the core's combinational illegal-instruction decode can never fire.
      drv_issue_resp(item);
      // ...then raise issue_ready to complete the handshake with accept high.
      cntxt.vif.issue_ready <= 1'b1;
      @(posedge cntxt.vif.clk);
      // Queue the result immediately (do NOT wait for issue_valid to drop:
      // the core holds issue_valid until it receives the result, so waiting
      // here would deadlock).  The parallel drv_result_in_order process drives
      // the writeback from resp_item_queue once the core is result-ready.
      if (item.result_valid) resp_item_queue.push_back(item);
      // Hold the handshake for one further cycle so the core samples it, then
      // withdraw issue_ready (the core drops issue_valid once it has accepted).
      @(posedge cntxt.vif.clk);
      cntxt.vif.issue_ready <= 1'b0;
      deassert_issue_resp();
      `uvm_info(info_tag, $sformatf("issue handshake done, sum=%0d", item.result.data), UVM_HIGH);
   end
   else if (item.compressed_valid) begin
      cntxt.vif.compressed_ready <= 1'b1;
      @(posedge cntxt.vif.clk);
      deassert_compressed_resp();
   end

endtask : drv_slv_resp

`endif // __UVME_CVXIF_DRV_C_SV__
