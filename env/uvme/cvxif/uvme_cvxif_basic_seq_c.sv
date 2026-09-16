// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local coprocessor-slave response sequence for the CV-X-IF agent.
// Accepts every issue request, reads rs1/rs2 and returns a writeback result
// whose data is rs1 + rs2.  Used by the directed CV32E20X firmware test.
//
// The vendored uvma_cvxif_intf / uvma_cvxif_resp_item types are used directly;
// the vendored pkg parameters X_NUM_RS=2 and X_ID_WIDTH=3 are accepted for
// this basic test (documented caveat in the integration plan).

`ifndef __UVME_CVXIF_BASIC_SEQ_C_SV__
`define __UVME_CVXIF_BASIC_SEQ_C_SV__

/**
 * Basic "accept all and add" coprocessor slave sequence.
 */
class uvme_cvxif_basic_seq_c extends uvme_cvxif_vseq_c;

   `uvm_object_utils(uvme_cvxif_basic_seq_c)

   extern function new(string name="uvme_cvxif_basic_seq");

   /**
    * Body: for each monitored issue request, produce an accept response and an
    * add-result writeback.  Runs until the sequence is killed (e.g. end of
    * test phase), matching the infinite slave behaviour of the agent's driver.
    */
   extern virtual task body();

endclass : uvme_cvxif_basic_seq_c


function uvme_cvxif_basic_seq_c::new(string name="uvme_cvxif_basic_seq");

   super.new(name);

endfunction : new


task uvme_cvxif_basic_seq_c::body();

   `uvm_info("CVXIF_BASICSEQ", "Basic CV-X-IF slave sequence body started", UVM_HIGH)

   forever begin
      uvma_cvxif_req_item_c  req;
      uvma_cvxif_resp_item_c rsp;
      bit [31:0] sum;

      // Block until the monitor posts a transaction to the agent's analysis
      // fifo (issue + register data are packed into a single item).
      req = uvma_cvxif_req_item_c::type_id::create("req");
      p_sequencer.mm_req_fifo.get(req);
      `uvm_info("CVXIF_BASICSEQ", $sformatf("Got req: issue_valid=%0b rs=%0h,%0h", req.issue_valid, req.register.rs[0], req.register.rs[1]), UVM_NONE)

      if (req.issue_valid) begin
         // Compute rs1 + rs2 from the register channel (rs[0], rs[1]).
         sum = req.register.rs[0] + req.register.rs[1];

         rsp = uvma_cvxif_resp_item_c::type_id::create("rsp");
         rsp.issue_valid = 1;
         rsp.issue_resp.accept        = 1'b1;
         // X_DUALWRITE=0 -> single writeback bit enables WE for the result.
         rsp.issue_resp.writeback     = 1'b1;
         // X_NUM_RS=2 -> rs1|rs2 register-read enables (plus X_DUALREAD=0).
         rsp.issue_resp.register_read = 2'b11;
         rsp.delay_resp               = 0;

         rsp.result_valid = 1;
         rsp.result.data  = sum;
         rsp.result.rd    = 5'b0;   // informational; the core uses its own rd.
         rsp.result.we    = 1'b1;
         rsp.result.id    = req.issue_req.id;
         rsp.result.hartid = req.issue_req.hartid;

         start_item(rsp);
         finish_item(rsp);
         `uvm_info("CVXIF_BASICSEQ", "Item done (driver accepted response)", UVM_NONE)
         `uvm_info("CVXIF_BASICSEQ", $sformatf("Responded to issue id=%0d, sum=%0h",
                                               req.issue_req.id, sum), UVM_HIGH)
      end
   end

endtask : body

`endif // __UVME_CVXIF_BASIC_SEQ_C_SV__
