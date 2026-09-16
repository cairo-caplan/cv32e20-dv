// Copyright (c) 2026 Eclipse Foundation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Fork-local derived agent class for the CV-X-IF coprocessor slave.
// Extends the (unmodified) vendored uvma_cvxif_agent_c.  The base class is
// used as-is for the component build/connect behaviour (create_components()
// constructs the vendored drv/mon/vsqr via type_id::create, which keeps the
// full slave protocol intact); this subclass registers factory overrides so
// that the vendored create_components() resolves the fork-local
// uvme_cvxif_drv_c / uvme_cvxif_mon_c components, and provides fork-local
// cfg/cntxt defaults when none are supplied via the configuration DB.

`ifndef __UVME_CVXIF_AGENT_C_SV__
`define __UVME_CVXIF_AGENT_C_SV__

/**
 * CV32E20-specific CV-X-IF agent.
 */
class uvme_cvxif_agent_c extends uvma_cvxif_agent_c;

   `uvm_component_utils(uvme_cvxif_agent_c)

   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvxif_agent", uvm_component parent=null);

   /**
    * 1. Rebuild the derived (fork-local) cfg/cntxt as defaults when none were
    *    provided via the configuration database, keeping the base build safe.
    * 2. Register factory overrides for the fork-local drv/mon components.
    */
   extern virtual function void build_phase(uvm_phase phase);

endclass : uvme_cvxif_agent_c


function uvme_cvxif_agent_c::new(string name="uvme_cvxif_agent", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvxif_agent_c::build_phase(uvm_phase phase);

   // The environment stores cfg/cntxt under the BASE types (uvma_cvxif_cfg_c /
   // uvma_cvxif_cntxt_c) at "*.cvxif_agent".  The config_db lookup key
   // includes the uvm_config_db#(T) type parameter, so the get below MUST
   // use the base types (exactly like the vendored agent, driver, monitor
   // and vsqr do); using the derived types here made the lookup miss even
   // when the env had already stored its randomized cfg, and the fallback
   // below then overwrote the env's cfg with an un-randomized object
   // (enabled_cvxif == 0 -> driver rejects all CPU requests).
   if (cfg == null) begin
      void'(uvm_config_db#(uvma_cvxif_cfg_c)::get(this, "", "cfg", cfg));
      if (cfg == null) begin
         // Fallback only: build a randomized fork-local cfg so the derived
         // soft constraints (enabled_cvxif == 1, ...) still apply.  Never
         // leave an un-randomized cfg behind.
         cfg = uvme_cvxif_cfg_c::type_id::create("cvxif_cfg");
         void'(cfg.randomize());
         uvm_config_db#(uvma_cvxif_cfg_c)::set(this, "*", "cfg", cfg);
      end
   end

   if (cntxt == null) begin
      void'(uvm_config_db#(uvma_cvxif_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (cntxt == null) begin
         cntxt = uvme_cvxif_cntxt_c::type_id::create("cvxif_cntxt");
         uvm_config_db#(uvma_cvxif_cntxt_c)::set(this, "*", "cntxt", cntxt);
      end
   end

   // Route the vendored create_components() type_id::create calls to the
   // fork-local driver/monitor overrides.
   set_type_override_by_type(uvma_cvxif_drv_c::get_type(), uvme_cvxif_drv_c::get_type());
   set_type_override_by_type(uvma_cvxif_mon_c::get_type(), uvme_cvxif_mon_c::get_type());

   super.build_phase(phase);

endfunction : build_phase

`endif // __UVME_CVXIF_AGENT_C_SV__
