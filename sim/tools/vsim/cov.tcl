
# Control variable for CV-X-IF exclusions, enabled only for the CV32E20X config
set XInterface 0
set CV_XIF_DISABLED_COMMENT {Only used when CV-X-IF is enabled (CV32E20X)}

# Bitmanip operations extension. Disabled for the CVE2.
set RVB 0
set RVB_DISABLED_COMMENT {RVB (Bitmanip) is disabled on the CVE2}


# cve2_load_store_unit
# ====================
#
# Coverage exclusions for cve2_load_store_unit
coverage exclude -du cve2_load_store_unit -linerange 124 140 154 372-381 428-443


# cve2_compressed_decoder
# =======================
#
#   Unreachable default cases
coverage exclude -du cve2_compressed_decoder -linerange 76 178 184 198 266
# To review:
# coverage exclude -du cve2_compressed_decoder -linerange 121 221 233 246

# cve2_if_stage
# =============
#
# Exclude dummy DPI functions needed by the former RISC-V compliance checking simulation model
# See rtl/cve2_if_stage.sv for more info
coverage exclude -du cve2_if_stage -linerange 181-194 -comment {Dummy sim-only simutil_get_scramble_key and simutil_get_scramble_nonce functions}
# To review:
# coverage exclude -du cve2_if_stage -linerange 156


# cve2_id_stage
# =============
coverage exclude -du cve2_id_stage -linerange 884 -comment {Default case for the id_fsm_q signal}
#   To review:
#   coverage exclude -du cve2_if_stage -linerange 608

# cve2_controller
# ===============
#
# To review:
#   instr_fetch_err_prio:
# coverage exclude -du cve2_controller -linerange 238 606-607
#   store_err_prio:
# coverage exclude -du cve2_controller -linerange 246 651-652
#   load_err_prio:
# coverage exclude -du cve2_controller -linerange 248 655-656
#   load_err_prio:
# coverage exclude -du cve2_controller -linerange 248 655-656
# irq_nm_i && !nmi_mode_q // enter NMI mode
# coverage exclude -du cve2_controller -linerange 502-503
# nmi_mode_q // exit NMI mode
# coverage exclude -du cve2_controller -linerange 667


# 
# TODO line 439 (illegal_insn = 1'b1;) is unreachable as it depends on instr[26] being 1, which falls on line 405
coverage exclude -du cve2_if_stage -linerange 439
#   Unreachable default cases
coverage exclude -du cve2_if_stage -linerange 448
# To review:
# coverage exclude -du cve2_if_stage -linerange 430 448

#   Exclude coverage for ID stage when CV-X-IF is disabled
if {!$XInterface} {
    coverage exclude -du cve2_id_stage -linerange 494 -comment $CV_XIF_DISABLED_COMMENT
    coverage exclude -du cve2_id_stage -linerange 829-832 -comment $CV_XIF_DISABLED_COMMENT
}

# Exclude coverage for RVB (Bitmanip) extension
if {!$RVB} {
    coverage exclude -du cve2_alu -linerange 88-90 285 308-315 319 376-378 1342 1345 1355 1359 1363 1366 1369-1378 1381-1382 1385 1388 1391-1392 -comment $RVB_DISABLED_COMMENT
    
}

coverage save -onexit -testname ${TEST} ${TEST}.ucdb