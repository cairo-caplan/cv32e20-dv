///////////////////////////////////////////
// rv32/I/I-addi.S
// Copyright (C) 2025 Harvey Mudd College & Oklahoma State University, UET Lahore, Habib University
//
// SPDX-License-Identifier: Apache-2.0
///////////////////////////////////////////

##### START_TEST_CONFIG #####
# REQUIRED_EXTENSIONS: ['I']
# params:
#   MXLEN: 32
# MARCH: rv32i
# CONFIG_DEPENDENT: false
##### END_TEST_CONFIG #####

#define TEST_FILE "I-addi.S"
#define SIGUPD_COUNT 378
#include "riscv_arch_test.h"

// Set up test environment and declare main entry point
RVTEST_BEGIN



cp_rs1_tests:

# Testcase cp_rs1 (Test source rs1 = x0)
RVTEST_TESTDATA_LOAD_INT(x6, x0) # load rs1: x0 = 0x05245fd3
addi x8, x0, 764 # perform operation
# Check if x8 contains the expected result. x3 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x3, x4, x5, x8, "test_1")

# Testcase cp_rs1 (Test source rs1 = x1)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x18b7f774
addi x2, x1, -293 # perform operation
# Check if x2 contains the expected result. x3 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x3, x4, x5, x2, "test_2")

# Testcase cp_rs1 (Test source rs1 = x2)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0xa32a09f7
addi x21, x2, -36 # perform operation
# Check if x21 contains the expected result. x3 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x3, x4, x5, x21, "test_3")

mv x23, x3 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x3)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0x9cf1ef82
addi x7, x3, 1260 # perform operation
# Check if x7 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x7, "test_4")

mv x7, x4 # switch link pointer register to avoid conflict with test

mv x8, x5 # switch temp pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x4)
RVTEST_TESTDATA_LOAD_INT(x6, x4) # load rs1: x4 = 0xca7af0fe
addi x3, x4, 675 # perform operation
# Check if x3 contains the expected result. x23 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x23, x7, x8, x3, "test_5")

# Testcase cp_rs1 (Test source rs1 = x5)
RVTEST_TESTDATA_LOAD_INT(x6, x5) # load rs1: x5 = 0x1bb0bef9
addi x20, x5, 49 # perform operation
# Check if x20 contains the expected result. x23 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x23, x7, x8, x20, "test_6")

mv x28, x6 # switch data pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x6)
RVTEST_TESTDATA_LOAD_INT(x28, x6) # load rs1: x6 = 0xf3793cc3
addi x9, x6, 299 # perform operation
# Check if x9 contains the expected result. x23 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x23, x7, x8, x9, "test_7")

mv x4, x7 # switch link pointer register to avoid conflict with test

mv x5, x8 # switch temp pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x7)
RVTEST_TESTDATA_LOAD_INT(x28, x7) # load rs1: x7 = 0xaf3dd45c
addi x24, x7, -1063 # perform operation
# Check if x24 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x24, "test_8")

# Testcase cp_rs1 (Test source rs1 = x8)
RVTEST_TESTDATA_LOAD_INT(x28, x8) # load rs1: x8 = 0x9b60f168
addi x30, x8, 1301 # perform operation
# Check if x30 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x30, "test_9")

# Testcase cp_rs1 (Test source rs1 = x9)
RVTEST_TESTDATA_LOAD_INT(x28, x9) # load rs1: x9 = 0xcf743e54
addi x17, x9, -439 # perform operation
# Check if x17 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x17, "test_10")

# Testcase cp_rs1 (Test source rs1 = x10)
RVTEST_TESTDATA_LOAD_INT(x28, x10) # load rs1: x10 = 0x70ea0cc9
addi x7, x10, 1486 # perform operation
# Check if x7 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x7, "test_11")

# Testcase cp_rs1 (Test source rs1 = x11)
RVTEST_TESTDATA_LOAD_INT(x28, x11) # load rs1: x11 = 0x1753f9da
addi x3, x11, -1399 # perform operation
# Check if x3 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x3, "test_12")

# Testcase cp_rs1 (Test source rs1 = x12)
RVTEST_TESTDATA_LOAD_INT(x28, x12) # load rs1: x12 = 0x40f11b39
addi x21, x12, -1005 # perform operation
# Check if x21 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x21, "test_13")

# Testcase cp_rs1 (Test source rs1 = x13)
RVTEST_TESTDATA_LOAD_INT(x28, x13) # load rs1: x13 = 0xa00cbc8d
addi x27, x13, 818 # perform operation
# Check if x27 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x27, "test_14")

# Testcase cp_rs1 (Test source rs1 = x14)
RVTEST_TESTDATA_LOAD_INT(x28, x14) # load rs1: x14 = 0x75750ad6
addi x18, x14, 1325 # perform operation
# Check if x18 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x18, "test_15")

# Testcase cp_rs1 (Test source rs1 = x15)
RVTEST_TESTDATA_LOAD_INT(x28, x15) # load rs1: x15 = 0x588f07b4
addi x3, x15, 1653 # perform operation
# Check if x3 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x3, "test_16")

# Testcase cp_rs1 (Test source rs1 = x16)
RVTEST_TESTDATA_LOAD_INT(x28, x16) # load rs1: x16 = 0x763b68b6
addi x27, x16, -479 # perform operation
# Check if x27 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x27, "test_17")

# Testcase cp_rs1 (Test source rs1 = x17)
RVTEST_TESTDATA_LOAD_INT(x28, x17) # load rs1: x17 = 0xf578bf05
addi x19, x17, 1075 # perform operation
# Check if x19 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x19, "test_18")

# Testcase cp_rs1 (Test source rs1 = x18)
RVTEST_TESTDATA_LOAD_INT(x28, x18) # load rs1: x18 = 0xba248708
addi x10, x18, 1967 # perform operation
# Check if x10 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x10, "test_19")

# Testcase cp_rs1 (Test source rs1 = x19)
RVTEST_TESTDATA_LOAD_INT(x28, x19) # load rs1: x19 = 0xfca8ab12
addi x26, x19, -597 # perform operation
# Check if x26 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x26, "test_20")

# Testcase cp_rs1 (Test source rs1 = x20)
RVTEST_TESTDATA_LOAD_INT(x28, x20) # load rs1: x20 = 0xf7e05b2e
addi x25, x20, 1073 # perform operation
# Check if x25 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x25, "test_21")

# Testcase cp_rs1 (Test source rs1 = x21)
RVTEST_TESTDATA_LOAD_INT(x28, x21) # load rs1: x21 = 0xd7d2059e
addi x7, x21, -993 # perform operation
# Check if x7 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x7, "test_22")

# Testcase cp_rs1 (Test source rs1 = x22)
RVTEST_TESTDATA_LOAD_INT(x28, x22) # load rs1: x22 = 0xaa5e9e68
addi x17, x22, 267 # perform operation
# Check if x17 contains the expected result. x23 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x23, x4, x5, x17, "test_23")

mv x6, x23 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x23)
RVTEST_TESTDATA_LOAD_INT(x28, x23) # load rs1: x23 = 0x80ad83d3
addi x27, x23, 1632 # perform operation
# Check if x27 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x27, "test_24")

# Testcase cp_rs1 (Test source rs1 = x24)
RVTEST_TESTDATA_LOAD_INT(x28, x24) # load rs1: x24 = 0xadcb0de0
addi x26, x24, -561 # perform operation
# Check if x26 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x26, "test_25")

# Testcase cp_rs1 (Test source rs1 = x25)
RVTEST_TESTDATA_LOAD_INT(x28, x25) # load rs1: x25 = 0x296e622d
addi x13, x25, -324 # perform operation
# Check if x13 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x13, "test_26")

# Testcase cp_rs1 (Test source rs1 = x26)
RVTEST_TESTDATA_LOAD_INT(x28, x26) # load rs1: x26 = 0x1f5c7868
addi x0, x26, -2029 # perform operation
# Check if x0 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x0, "test_27")

# Testcase cp_rs1 (Test source rs1 = x27)
RVTEST_TESTDATA_LOAD_INT(x28, x27) # load rs1: x27 = 0x4c87ebba
addi x13, x27, 974 # perform operation
# Check if x13 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x13, "test_28")

mv x15, x28 # switch data pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x28)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0x299ffc3d
addi x27, x28, 670 # perform operation
# Check if x27 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x27, "test_29")

# Testcase cp_rs1 (Test source rs1 = x29)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0xc8470859
addi x12, x29, -240 # perform operation
# Check if x12 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x12, "test_30")

# Testcase cp_rs1 (Test source rs1 = x30)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x8fc90337
addi x13, x30, -1986 # perform operation
# Check if x13 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x13, "test_31")

# Testcase cp_rs1 (Test source rs1 = x31)
RVTEST_TESTDATA_LOAD_INT(x15, x31) # load rs1: x31 = 0x96b4a195
addi x29, x31, 939 # perform operation
# Check if x29 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x29, "test_32")


cp_rd_tests:

# Testcase cp_rd (Test destination rd = x0)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x08e9703f
addi x0, x24, 489 # perform operation
# Check if x0 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x0, "test_33")

# Testcase cp_rd (Test destination rd = x1)
RVTEST_TESTDATA_LOAD_INT(x15, x19) # load rs1: x19 = 0xa322e604
addi x1, x19, 1106 # perform operation
# Check if x1 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x1, "test_34")

# Testcase cp_rd (Test destination rd = x2)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x0be9d7a4
addi x2, x1, -424 # perform operation
# Check if x2 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x2, "test_35")

# Testcase cp_rd (Test destination rd = x3)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x3615b581
addi x3, x25, 1269 # perform operation
# Check if x3 contains the expected result. x6 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x6, x4, x5, x3, "test_36")

mv x12, x4 # switch link pointer register to avoid conflict with test

mv x13, x5 # switch temp pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x4)
RVTEST_TESTDATA_LOAD_INT(x15, x0) # load rs1: x0 = 0xb4cf6b77
addi x4, x0, -1543 # perform operation
# Check if x4 contains the expected result. x6 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x6, x12, x13, x4, "test_37")

# Testcase cp_rd (Test destination rd = x5)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x3fef7926
addi x5, x4, -225 # perform operation
# Check if x5 contains the expected result. x6 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x6, x12, x13, x5, "test_38")

mv x25, x6 # switch signature pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x6)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x332ceb48
addi x6, x26, 1705 # perform operation
# Check if x6 contains the expected result. x25 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x25, x12, x13, x6, "test_39")

# Testcase cp_rd (Test destination rd = x7)
RVTEST_TESTDATA_LOAD_INT(x15, x19) # load rs1: x19 = 0x121cb7c0
addi x7, x19, -608 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x25, x12, x13, x7, "test_40")

# Testcase cp_rd (Test destination rd = x8)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x1ea0faf3
addi x8, x29, 257 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x25, x12, x13, x8, "test_41")

# Testcase cp_rd (Test destination rd = x9)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x204ac672
addi x9, x1, 227 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x25, x12, x13, x9, "test_42")

# Testcase cp_rd (Test destination rd = x10)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x52262a85
addi x10, x16, -1095 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x25, x12, x13, x10, "test_43")

# Testcase cp_rd (Test destination rd = x11)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0xdff02d18
addi x11, x17, -731 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x25, x12, x13, x11, "test_44")

mv x7, x12 # switch link pointer register to avoid conflict with test

mv x8, x13 # switch temp pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x12)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0x33f56cad
addi x12, x22, 172 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x12, "test_45")

# Testcase cp_rd (Test destination rd = x13)
RVTEST_TESTDATA_LOAD_INT(x15, x0) # load rs1: x0 = 0xcf8d8128
addi x13, x0, 1601 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x13, "test_46")

# Testcase cp_rd (Test destination rd = x14)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x10e841df
addi x14, x10, -61 # perform operation
# Check if x14 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x14, "test_47")

mv x29, x15 # switch data pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x15)
RVTEST_TESTDATA_LOAD_INT(x29, x22) # load rs1: x22 = 0x6007a32d
addi x15, x22, -602 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x15, "test_48")

# Testcase cp_rd (Test destination rd = x16)
RVTEST_TESTDATA_LOAD_INT(x29, x19) # load rs1: x19 = 0x2202375e
addi x16, x19, 76 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x16, "test_49")

# Testcase cp_rd (Test destination rd = x17)
RVTEST_TESTDATA_LOAD_INT(x29, x19) # load rs1: x19 = 0xafad6c85
addi x17, x19, -486 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x17, "test_50")

# Testcase cp_rd (Test destination rd = x18)
RVTEST_TESTDATA_LOAD_INT(x29, x26) # load rs1: x26 = 0xc7857ba3
addi x18, x26, -1612 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x18, "test_51")

# Testcase cp_rd (Test destination rd = x19)
RVTEST_TESTDATA_LOAD_INT(x29, x24) # load rs1: x24 = 0xcec4e5b9
addi x19, x24, -161 # perform operation
# Check if x19 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x19, "test_52")

# Testcase cp_rd (Test destination rd = x20)
RVTEST_TESTDATA_LOAD_INT(x29, x30) # load rs1: x30 = 0x3b1e3d77
addi x20, x30, -1391 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x20, "test_53")

# Testcase cp_rd (Test destination rd = x21)
RVTEST_TESTDATA_LOAD_INT(x29, x16) # load rs1: x16 = 0x597fda7b
addi x21, x16, -1491 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x21, "test_54")

# Testcase cp_rd (Test destination rd = x22)
RVTEST_TESTDATA_LOAD_INT(x29, x31) # load rs1: x31 = 0x0af70b96
addi x22, x31, 12 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x22, "test_55")

# Testcase cp_rd (Test destination rd = x23)
RVTEST_TESTDATA_LOAD_INT(x29, x6) # load rs1: x6 = 0x57ec10a2
addi x23, x6, -943 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x23, "test_56")

# Testcase cp_rd (Test destination rd = x24)
RVTEST_TESTDATA_LOAD_INT(x29, x23) # load rs1: x23 = 0x8e598415
addi x24, x23, 975 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x24, "test_57")

mv x31, x25 # switch signature pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x25)
RVTEST_TESTDATA_LOAD_INT(x29, x9) # load rs1: x9 = 0xbbf1993a
addi x25, x9, 1638 # perform operation
# Check if x25 contains the expected result. x31 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x31, x7, x8, x25, "test_58")

# Testcase cp_rd (Test destination rd = x26)
RVTEST_TESTDATA_LOAD_INT(x29, x4) # load rs1: x4 = 0x350ddce0
addi x26, x4, 1067 # perform operation
# Check if x26 contains the expected result. x31 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x31, x7, x8, x26, "test_59")

# Testcase cp_rd (Test destination rd = x27)
RVTEST_TESTDATA_LOAD_INT(x29, x15) # load rs1: x15 = 0xddc01ebe
addi x27, x15, -1248 # perform operation
# Check if x27 contains the expected result. x31 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x31, x7, x8, x27, "test_60")

# Testcase cp_rd (Test destination rd = x28)
RVTEST_TESTDATA_LOAD_INT(x29, x17) # load rs1: x17 = 0xccdf9ef4
addi x28, x17, 12 # perform operation
# Check if x28 contains the expected result. x31 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x31, x7, x8, x28, "test_61")

mv x15, x29 # switch data pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x29)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0xc0581916
addi x29, x2, 157 # perform operation
# Check if x29 contains the expected result. x31 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x31, x7, x8, x29, "test_62")

# Testcase cp_rd (Test destination rd = x30)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0xe380e46f
addi x30, x13, -588 # perform operation
# Check if x30 contains the expected result. x31 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x31, x7, x8, x30, "test_63")

mv x19, x31 # switch signature pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x31)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x1bfd803b
addi x31, x4, -924 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_64")


cp_rs1_edges_tests:

# Testcase cp_rs1_edges (Test source rs1 value = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x00000000
addi x12, x16, 209 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_65")

# Testcase cp_rs1_edges (Test source rs1 value = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x00000001
addi x3, x1, 1070 # perform operation
# Check if x3 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x3, "test_66")

# Testcase cp_rs1_edges (Test source rs1 value = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0x00000002
addi x2, x28, -201 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_67")

# Testcase cp_rs1_edges (Test source rs1 value = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x80000000
addi x23, x20, -117 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_68")

# Testcase cp_rs1_edges (Test source rs1 value = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0x80000001
addi x14, x9, 230 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_69")

# Testcase cp_rs1_edges (Test source rs1 value = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x7fffffff
addi x25, x30, 963 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_70")

# Testcase cp_rs1_edges (Test source rs1 value = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x7ffffffe
addi x23, x24, 1599 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_71")

# Testcase cp_rs1_edges (Test source rs1 value = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0xffffffff
addi x31, x14, -817 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_72")

# Testcase cp_rs1_edges (Test source rs1 value = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0xfffffffe
addi x17, x11, -2027 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_73")

# Testcase cp_rs1_edges (Test source rs1 value = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x15, x23) # load rs1: x23 = 0x5bbc8872
addi x29, x23, -1891 # perform operation
# Check if x29 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x29, "test_74")

# Testcase cp_rs1_edges (Test source rs1 value = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0xaaaaaaaa
addi x9, x3, 222 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_75")

# Testcase cp_rs1_edges (Test source rs1 value = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x55555555
addi x1, x29, -444 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_76")


cr_rs1_imm_edges_tests:

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x00000000
addi x6, x16, 0 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_77")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x00000000
addi x9, x29, 1 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_78")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x00000000
addi x2, x30, 2 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_79")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x00000000
addi x4, x21, 3 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_80")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x23) # load rs1: x23 = 0x00000000
addi x1, x23, 4 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_81")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x00000000
addi x24, x1, 8 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_82")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x00000000
addi x28, x27, 16 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_83")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x00000000
addi x1, x6, 32 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_84")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x00000000
addi x16, x24, 64 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_85")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x18) # load rs1: x18 = 0x00000000
addi x31, x18, 128 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_86")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x00000000
addi x22, x21, 256 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_87")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x00000000
addi x31, x4, 512 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_88")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0x00000000
addi x1, x22, 1023 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_89")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x00000000
addi x9, x11, 1024 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_90")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x00000000
addi x12, x1, 1795 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_91")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x00000000
addi x31, x21, 2047 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_92")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x31) # load rs1: x31 = 0x00000000
addi x23, x31, -2048 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_93")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x00000000
addi x6, x21, -2047 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_94")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x00000000
addi x9, x2, -2 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_95")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000000, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x00000000
addi x1, x20, -1 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_96")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x00000001
addi x2, x25, 0 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_97")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x18) # load rs1: x18 = 0x00000001
addi x24, x18, 1 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_98")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x00000001
addi x17, x2, 2 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_99")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0x00000001
addi x5, x14, 3 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_100")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x00000001
addi x3, x6, 4 # perform operation
# Check if x3 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x3, "test_101")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x00000001
addi x18, x16, 8 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_102")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x31) # load rs1: x31 = 0x00000001
addi x26, x31, 16 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_103")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0x00000001
addi x10, x13, 32 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_104")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x00000001
addi x9, x2, 64 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_105")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x00000001
addi x17, x2, 128 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_106")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0x00000001
addi x9, x22, 256 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_107")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x00000001
addi x22, x20, 512 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_108")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x00000001
addi x23, x25, 1023 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_109")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x00000001
addi x18, x4, 1024 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_110")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x00000001
addi x13, x3, 1795 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_111")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x00000001
addi x6, x24, 2047 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_112")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x00000001
addi x23, x10, -2048 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_113")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x00000001
addi x5, x10, -2047 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_114")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x00000001
addi x18, x27, -2 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_115")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000001, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x00000001
addi x14, x3, -1 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_116")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x00000002
addi x11, x10, 0 # perform operation
# Check if x11 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x11, "test_117")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x00000002
addi x21, x12, 1 # perform operation
# Check if x21 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x21, "test_118")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x00000002
addi x14, x24, 2 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_119")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x00000002
addi x26, x17, 3 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_120")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x00000002
addi x25, x6, 4 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_121")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x00000002
addi x17, x25, 8 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_122")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x00000002
addi x28, x1, 16 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_123")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x00000002
addi x10, x2, 32 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_124")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x00000002
addi x14, x26, 64 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_125")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x00000002
addi x4, x17, 128 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_126")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x00000002
addi x5, x26, 256 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_127")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x23) # load rs1: x23 = 0x00000002
addi x18, x23, 512 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_128")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x00000002
addi x5, x11, 1023 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_129")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0x00000002
addi x17, x14, 1024 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_130")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x23) # load rs1: x23 = 0x00000002
addi x14, x23, 1795 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_131")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0x00000002
addi x25, x5, 2047 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_132")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x00000002
addi x14, x26, -2048 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_133")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x00000002
addi x18, x20, -2047 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_134")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0x00000002
addi x13, x14, -2 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_135")

# Testcase cr_rs1_imm_edges (rs1 = 0x00000002, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x00000002
addi x16, x24, -1 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_136")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x80000000
addi x17, x1, 0 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_137")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x80000000
addi x25, x17, 1 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_138")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x80000000
addi x29, x20, 2 # perform operation
# Check if x29 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x29, "test_139")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x80000000
addi x5, x1, 3 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_140")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x80000000
addi x10, x26, 4 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_141")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x80000000
addi x1, x25, 8 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_142")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x80000000
addi x13, x6, 16 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_143")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0x80000000
addi x26, x9, 32 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_144")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x80000000
addi x4, x21, 64 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_145")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x80000000
addi x10, x3, 128 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_146")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x31) # load rs1: x31 = 0x80000000
addi x6, x31, 256 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_147")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x80000000
addi x12, x11, 512 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_148")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x80000000
addi x24, x10, 1023 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_149")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x80000000
addi x22, x12, 1024 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_150")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x80000000
addi x28, x17, 1795 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_151")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x80000000
addi x26, x16, 2047 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_152")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x80000000
addi x10, x3, -2048 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_153")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x80000000
addi x30, x26, -2047 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_154")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0x80000000
addi x26, x28, -2 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_155")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000000, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0x80000000
addi x28, x13, -1 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_156")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x80000001
addi x16, x21, 0 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_157")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x80000001
addi x22, x24, 1 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_158")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x80000001
addi x17, x11, 2 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_159")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x80000001
addi x30, x10, 3 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_160")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x80000001
addi x18, x16, 4 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_161")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x80000001
addi x24, x4, 8 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_162")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x31) # load rs1: x31 = 0x80000001
addi x23, x31, 16 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_163")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0x80000001
addi x28, x22, 32 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_164")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x80000001
addi x10, x25, 64 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_165")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x80000001
addi x14, x29, 128 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_166")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x80000001
addi x25, x11, 256 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_167")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0x80000001
addi x2, x9, 512 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_168")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x80000001
addi x17, x26, 1023 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_169")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x80000001
addi x22, x10, 1024 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_170")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x80000001
addi x25, x29, 1795 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_171")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x80000001
addi x23, x1, 2047 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_172")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x80000001
addi x14, x16, -2048 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_173")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x80000001
addi x12, x20, -2047 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_174")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x80000001
addi x29, x6, -2 # perform operation
# Check if x29 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x29, "test_175")

# Testcase cr_rs1_imm_edges (rs1 = 0x80000001, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x80000001
addi x26, x30, -1 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_176")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x7fffffff
addi x20, x10, 0 # perform operation
# Check if x20 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x20, "test_177")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x7fffffff
addi x12, x30, 1 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_178")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x7fffffff
addi x22, x16, 2 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_179")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x7fffffff
addi x16, x27, 3 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_180")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x7fffffff
addi x13, x26, 4 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_181")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x7fffffff
addi x25, x26, 8 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_182")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x7fffffff
addi x14, x24, 16 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_183")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x18) # load rs1: x18 = 0x7fffffff
addi x25, x18, 32 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_184")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x7fffffff
addi x25, x17, 64 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_185")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x7fffffff
addi x25, x3, 128 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_186")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x7fffffff
addi x17, x30, 256 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_187")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x7fffffff
addi x27, x26, 512 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_188")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x7fffffff
addi x13, x6, 1023 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_189")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x7fffffff
addi x10, x12, 1024 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_190")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x7fffffff
addi x30, x20, 1795 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_191")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x7fffffff
addi x1, x4, 2047 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_192")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x7fffffff
addi x22, x11, -2048 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_193")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x7fffffff
addi x28, x29, -2047 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_194")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x7fffffff
addi x24, x3, -2 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_195")

# Testcase cr_rs1_imm_edges (rs1 = 0x7fffffff, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0x7fffffff
addi x13, x5, -1 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_196")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x7ffffffe
addi x6, x27, 0 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_197")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0x7ffffffe
addi x23, x5, 1 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_198")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0x7ffffffe
addi x12, x9, 2 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_199")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x7ffffffe
addi x2, x21, 3 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_200")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x7ffffffe
addi x25, x16, 4 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_201")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0x7ffffffe
addi x28, x5, 8 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_202")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0x7ffffffe
addi x10, x9, 16 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_203")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0x7ffffffe
addi x12, x13, 32 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_204")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x7ffffffe
addi x6, x11, 64 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_205")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x7ffffffe
addi x3, x11, 128 # perform operation
# Check if x3 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x3, "test_206")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0x7ffffffe
addi x9, x28, 256 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_207")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0x7ffffffe
addi x10, x24, 512 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_208")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x7ffffffe
addi x30, x10, 1023 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_209")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x7ffffffe
addi x24, x26, 1024 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_210")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x7ffffffe
addi x9, x26, 1795 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_211")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x7ffffffe
addi x31, x27, 2047 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_212")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x7ffffffe
addi x20, x25, -2048 # perform operation
# Check if x20 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x20, "test_213")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x7ffffffe
addi x14, x10, -2047 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_214")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0x7ffffffe
addi x22, x29, -2 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_215")

# Testcase cr_rs1_imm_edges (rs1 = 0x7ffffffe, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x7ffffffe
addi x4, x20, -1 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_216")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xffffffff
addi x23, x9, 0 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_217")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0xffffffff
addi x26, x1, 1 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_218")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0xffffffff
addi x20, x2, 2 # perform operation
# Check if x20 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x20, "test_219")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x31) # load rs1: x31 = 0xffffffff
addi x3, x31, 3 # perform operation
# Check if x3 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x3, "test_220")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0xffffffff
addi x18, x25, 4 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_221")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0xffffffff
addi x18, x11, 8 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x18, "test_222")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xffffffff
addi x1, x9, 16 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_223")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xffffffff
addi x11, x9, 32 # perform operation
# Check if x11 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x11, "test_224")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0xffffffff
addi x26, x29, 64 # perform operation
# Check if x26 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x26, "test_225")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0xffffffff
addi x6, x30, 128 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_226")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0xffffffff
addi x25, x30, 256 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_227")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x18) # load rs1: x18 = 0xffffffff
addi x5, x18, 512 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_228")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0xffffffff
addi x30, x28, 1023 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_229")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0xffffffff
addi x14, x4, 1024 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_230")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0xffffffff
addi x10, x25, 1795 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_231")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0xffffffff
addi x20, x26, 2047 # perform operation
# Check if x20 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x20, "test_232")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0xffffffff
addi x22, x11, -2048 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_233")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0xffffffff
addi x4, x10, -2047 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_234")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xffffffff
addi x14, x9, -2 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_235")

# Testcase cr_rs1_imm_edges (rs1 = 0xffffffff, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x24) # load rs1: x24 = 0xffffffff
addi x1, x24, -1 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_236")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0xfffffffe
addi x27, x21, 0 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_237")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0xfffffffe
addi x1, x5, 1 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_238")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xfffffffe
addi x25, x9, 2 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_239")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0xfffffffe
addi x30, x10, 3 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_240")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x23) # load rs1: x23 = 0xfffffffe
addi x28, x23, 4 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_241")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0xfffffffe
addi x22, x25, 8 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_242")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0xfffffffe
addi x30, x28, 16 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_243")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xfffffffe
addi x2, x9, 32 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_244")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0xfffffffe
addi x9, x26, 64 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_245")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0xfffffffe
addi x27, x10, 128 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_246")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x18) # load rs1: x18 = 0xfffffffe
addi x16, x18, 256 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_247")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0xfffffffe
addi x5, x28, 512 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_248")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0xfffffffe
addi x30, x16, 1023 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_249")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0xfffffffe
addi x27, x4, 1024 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_250")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0xfffffffe
addi x4, x22, 1795 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_251")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0xfffffffe
addi x1, x26, 2047 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_252")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0xfffffffe
addi x28, x14, -2048 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_253")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0xfffffffe
addi x17, x5, -2047 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_254")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0xfffffffe
addi x31, x16, -2 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x31, "test_255")

# Testcase cr_rs1_imm_edges (rs1 = 0xfffffffe, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0xfffffffe
addi x23, x11, -1 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_256")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0x5bbc8872
addi x14, x13, 0 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_257")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x5bbc8872
addi x9, x17, 1 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_258")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x5bbc8872
addi x16, x11, 2 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_259")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x5bbc8872
addi x29, x30, 3 # perform operation
# Check if x29 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x29, "test_260")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x5bbc8872
addi x6, x20, 4 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_261")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x5bbc8872
addi x21, x26, 8 # perform operation
# Check if x21 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x21, "test_262")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x5bbc8872
addi x14, x6, 16 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_263")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x5bbc8872
addi x11, x26, 32 # perform operation
# Check if x11 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x11, "test_264")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x5bbc8872
addi x10, x12, 64 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_265")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x5bbc8872
addi x30, x2, 128 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x30, "test_266")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x5bbc8872
addi x28, x12, 256 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x28, "test_267")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0x5bbc8872
addi x20, x5, 512 # perform operation
# Check if x20 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x20, "test_268")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0x5bbc8872
addi x10, x11, 1023 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_269")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0x5bbc8872
addi x25, x30, 1024 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_270")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x5bbc8872
addi x9, x26, 1795 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_271")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x16) # load rs1: x16 = 0x5bbc8872
addi x5, x16, 2047 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_272")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x5bbc8872
addi x4, x26, -2048 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_273")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x5bbc8872
addi x16, x21, -2047 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_274")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0x5bbc8872
addi x14, x21, -2 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_275")

# Testcase cr_rs1_imm_edges (rs1 = 0x5bbc8872, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0x5bbc8872
addi x6, x9, -1 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_276")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0xaaaaaaaa
addi x16, x11, 0 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_277")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0xaaaaaaaa
addi x17, x28, 1 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x17, "test_278")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0xaaaaaaaa
addi x24, x17, 2 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_279")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0xaaaaaaaa
addi x25, x12, 3 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_280")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x21) # load rs1: x21 = 0xaaaaaaaa
addi x6, x21, 4 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_281")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0xaaaaaaaa
addi x23, x10, 8 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_282")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0xaaaaaaaa
addi x13, x30, 16 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_283")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0xaaaaaaaa
addi x27, x30, 32 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_284")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0xaaaaaaaa
addi x24, x22, 64 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_285")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0xaaaaaaaa
addi x10, x20, 128 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_286")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0xaaaaaaaa
addi x3, x14, 256 # perform operation
# Check if x3 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x3, "test_287")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0xaaaaaaaa
addi x10, x2, 512 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_288")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0xaaaaaaaa
addi x9, x22, 1023 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x9, "test_289")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0xaaaaaaaa
addi x1, x13, 1024 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_290")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0xaaaaaaaa
addi x11, x29, 1795 # perform operation
# Check if x11 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x11, "test_291")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x30) # load rs1: x30 = 0xaaaaaaaa
addi x1, x30, 2047 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_292")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0xaaaaaaaa
addi x27, x3, -2048 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_293")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x29) # load rs1: x29 = 0xaaaaaaaa
addi x22, x29, -2047 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_294")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0xaaaaaaaa
addi x1, x26, -2 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_295")

# Testcase cr_rs1_imm_edges (rs1 = 0xaaaaaaaa, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0xaaaaaaaa
addi x10, x12, -1 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x10, "test_296")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 0)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x55555555
addi x6, x25, 0 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_297")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 1)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x55555555
addi x13, x27, 1 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_298")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 2)
RVTEST_TESTDATA_LOAD_INT(x15, x27) # load rs1: x27 = 0x55555555
addi x22, x27, 2 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_299")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 3)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x55555555
addi x6, x25, 3 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_300")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 4)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0x55555555
addi x21, x14, 4 # perform operation
# Check if x21 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x21, "test_301")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 8)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x55555555
addi x24, x26, 8 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_302")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 16)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x55555555
addi x1, x20, 16 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_303")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 32)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x55555555
addi x5, x6, 32 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_304")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 64)
RVTEST_TESTDATA_LOAD_INT(x15, x28) # load rs1: x28 = 0x55555555
addi x27, x28, 64 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_305")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 128)
RVTEST_TESTDATA_LOAD_INT(x15, x17) # load rs1: x17 = 0x55555555
addi x22, x17, 128 # perform operation
# Check if x22 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x22, "test_306")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 256)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0x55555555
addi x13, x14, 256 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_307")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 512)
RVTEST_TESTDATA_LOAD_INT(x15, x25) # load rs1: x25 = 0x55555555
addi x14, x25, 512 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x14, "test_308")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x55555555
addi x27, x20, 1023 # perform operation
# Check if x27 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x27, "test_309")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x15, x20) # load rs1: x20 = 0x55555555
addi x12, x20, 1024 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x12, "test_310")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x55555555
addi x23, x10, 1795 # perform operation
# Check if x23 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x23, "test_311")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x15, x22) # load rs1: x22 = 0x55555555
addi x24, x22, 2047 # perform operation
# Check if x24 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x24, "test_312")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x55555555
addi x16, x12, -2048 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x16, "test_313")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x15, x26) # load rs1: x26 = 0x55555555
addi x25, x26, -2047 # perform operation
# Check if x25 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x25, "test_314")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = -2)
RVTEST_TESTDATA_LOAD_INT(x15, x23) # load rs1: x23 = 0x55555555
addi x13, x23, -2 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x13, "test_315")

# Testcase cr_rs1_imm_edges (rs1 = 0x55555555, imm = -1)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x55555555
addi x6, x4, -1 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_316")


cmp_rd_rs1_tests:

# Testcase cmp_rd_rs1 (Test rd = rs1 = x0)
RVTEST_TESTDATA_LOAD_INT(x15, x0) # load rs1: x0 = 0x22ae8c27
addi x0, x0, 235 # perform operation
# Check if x0 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x0, "test_317")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x1)
RVTEST_TESTDATA_LOAD_INT(x15, x1) # load rs1: x1 = 0x2ca0964c
addi x1, x1, 303 # perform operation
# Check if x1 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x1, "test_318")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x2)
RVTEST_TESTDATA_LOAD_INT(x15, x2) # load rs1: x2 = 0x933bd420
addi x2, x2, 1172 # perform operation
# Check if x2 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x2, "test_319")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x3)
RVTEST_TESTDATA_LOAD_INT(x15, x3) # load rs1: x3 = 0x43037f69
addi x3, x3, 1536 # perform operation
# Check if x3 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x3, "test_320")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x4)
RVTEST_TESTDATA_LOAD_INT(x15, x4) # load rs1: x4 = 0x358a1d9d
addi x4, x4, 1564 # perform operation
# Check if x4 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x4, "test_321")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x5)
RVTEST_TESTDATA_LOAD_INT(x15, x5) # load rs1: x5 = 0x7741da92
addi x5, x5, -481 # perform operation
# Check if x5 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x5, "test_322")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x6)
RVTEST_TESTDATA_LOAD_INT(x15, x6) # load rs1: x6 = 0x3ed4d086
addi x6, x6, -1075 # perform operation
# Check if x6 contains the expected result. x19 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x19, x7, x8, x6, "test_323")

mv x4, x7 # switch link pointer register to avoid conflict with test

mv x5, x8 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x7)
RVTEST_TESTDATA_LOAD_INT(x15, x7) # load rs1: x7 = 0x4e18c5b3
addi x7, x7, -1111 # perform operation
# Check if x7 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x7, "test_324")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x8)
RVTEST_TESTDATA_LOAD_INT(x15, x8) # load rs1: x8 = 0x9773ad5b
addi x8, x8, 1000 # perform operation
# Check if x8 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x8, "test_325")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x9)
RVTEST_TESTDATA_LOAD_INT(x15, x9) # load rs1: x9 = 0xab1dde6e
addi x9, x9, -1086 # perform operation
# Check if x9 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x9, "test_326")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x10)
RVTEST_TESTDATA_LOAD_INT(x15, x10) # load rs1: x10 = 0x86517846
addi x10, x10, -28 # perform operation
# Check if x10 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x10, "test_327")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x11)
RVTEST_TESTDATA_LOAD_INT(x15, x11) # load rs1: x11 = 0xf675bace
addi x11, x11, -1164 # perform operation
# Check if x11 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x11, "test_328")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x12)
RVTEST_TESTDATA_LOAD_INT(x15, x12) # load rs1: x12 = 0x0c2933ad
addi x12, x12, 903 # perform operation
# Check if x12 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x12, "test_329")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x13)
RVTEST_TESTDATA_LOAD_INT(x15, x13) # load rs1: x13 = 0x482073a0
addi x13, x13, 1730 # perform operation
# Check if x13 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x13, "test_330")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x14)
RVTEST_TESTDATA_LOAD_INT(x15, x14) # load rs1: x14 = 0xc5d616ed
addi x14, x14, 1973 # perform operation
# Check if x14 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x14, "test_331")

mv x25, x15 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x15)
RVTEST_TESTDATA_LOAD_INT(x25, x15) # load rs1: x15 = 0xc4457a0c
addi x15, x15, 151 # perform operation
# Check if x15 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x15, "test_332")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x16)
RVTEST_TESTDATA_LOAD_INT(x25, x16) # load rs1: x16 = 0x46206b37
addi x16, x16, 231 # perform operation
# Check if x16 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x16, "test_333")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x17)
RVTEST_TESTDATA_LOAD_INT(x25, x17) # load rs1: x17 = 0xd2324c5e
addi x17, x17, -616 # perform operation
# Check if x17 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x17, "test_334")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x18)
RVTEST_TESTDATA_LOAD_INT(x25, x18) # load rs1: x18 = 0xa7264cd8
addi x18, x18, 49 # perform operation
# Check if x18 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x18, "test_335")

mv x22, x19 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x19)
RVTEST_TESTDATA_LOAD_INT(x25, x19) # load rs1: x19 = 0x48c91ef8
addi x19, x19, 1100 # perform operation
# Check if x19 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x19, "test_336")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x20)
RVTEST_TESTDATA_LOAD_INT(x25, x20) # load rs1: x20 = 0x1ae8ab56
addi x20, x20, 1505 # perform operation
# Check if x20 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x20, "test_337")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x21)
RVTEST_TESTDATA_LOAD_INT(x25, x21) # load rs1: x21 = 0x190c9629
addi x21, x21, -1070 # perform operation
# Check if x21 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x21, "test_338")

mv x9, x22 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x22)
RVTEST_TESTDATA_LOAD_INT(x25, x22) # load rs1: x22 = 0x0d102961
addi x22, x22, 329 # perform operation
# Check if x22 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x22, "test_339")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x23)
RVTEST_TESTDATA_LOAD_INT(x25, x23) # load rs1: x23 = 0x000f2075
addi x23, x23, 1293 # perform operation
# Check if x23 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x23, "test_340")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x24)
RVTEST_TESTDATA_LOAD_INT(x25, x24) # load rs1: x24 = 0x75668d74
addi x24, x24, 1454 # perform operation
# Check if x24 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x24, "test_341")

mv x22, x25 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x25)
RVTEST_TESTDATA_LOAD_INT(x22, x25) # load rs1: x25 = 0xe02d511e
addi x25, x25, -1710 # perform operation
# Check if x25 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x25, "test_342")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x26)
RVTEST_TESTDATA_LOAD_INT(x22, x26) # load rs1: x26 = 0x6732dc0d
addi x26, x26, -1192 # perform operation
# Check if x26 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x26, "test_343")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x27)
RVTEST_TESTDATA_LOAD_INT(x22, x27) # load rs1: x27 = 0xa78a8eaa
addi x27, x27, -351 # perform operation
# Check if x27 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x27, "test_344")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x28)
RVTEST_TESTDATA_LOAD_INT(x22, x28) # load rs1: x28 = 0x0a68b9de
addi x28, x28, -492 # perform operation
# Check if x28 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x28, "test_345")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x29)
RVTEST_TESTDATA_LOAD_INT(x22, x29) # load rs1: x29 = 0xd48933f3
addi x29, x29, -816 # perform operation
# Check if x29 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x29, "test_346")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x30)
RVTEST_TESTDATA_LOAD_INT(x22, x30) # load rs1: x30 = 0x316d3323
addi x30, x30, -76 # perform operation
# Check if x30 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x30, "test_347")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x31)
RVTEST_TESTDATA_LOAD_INT(x22, x31) # load rs1: x31 = 0x41aa3c31
addi x31, x31, -1798 # perform operation
# Check if x31 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x31, "test_348")


cp_imm_edges_tests:

# Testcase cp_imm_edges (imm = 0)
RVTEST_TESTDATA_LOAD_INT(x22, x25) # load rs1: x25 = 0xa0480c3e
addi x17, x25, 0 # perform operation
# Check if x17 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x17, "test_349")

# Testcase cp_imm_edges (imm = 1)
RVTEST_TESTDATA_LOAD_INT(x22, x30) # load rs1: x30 = 0xfba68bf1
addi x7, x30, 1 # perform operation
# Check if x7 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x7, "test_350")

# Testcase cp_imm_edges (imm = 2)
RVTEST_TESTDATA_LOAD_INT(x22, x15) # load rs1: x15 = 0xb16b2e5e
addi x10, x15, 2 # perform operation
# Check if x10 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x10, "test_351")

# Testcase cp_imm_edges (imm = 3)
RVTEST_TESTDATA_LOAD_INT(x22, x8) # load rs1: x8 = 0x0271e71a
addi x30, x8, 3 # perform operation
# Check if x30 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x30, "test_352")

# Testcase cp_imm_edges (imm = 4)
RVTEST_TESTDATA_LOAD_INT(x22, x23) # load rs1: x23 = 0x48650232
addi x11, x23, 4 # perform operation
# Check if x11 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x11, "test_353")

# Testcase cp_imm_edges (imm = 8)
RVTEST_TESTDATA_LOAD_INT(x22, x14) # load rs1: x14 = 0xdb25ed37
addi x29, x14, 8 # perform operation
# Check if x29 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x29, "test_354")

# Testcase cp_imm_edges (imm = 16)
RVTEST_TESTDATA_LOAD_INT(x22, x13) # load rs1: x13 = 0x1123e1ad
addi x1, x13, 16 # perform operation
# Check if x1 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x1, "test_355")

# Testcase cp_imm_edges (imm = 32)
RVTEST_TESTDATA_LOAD_INT(x22, x29) # load rs1: x29 = 0xe9968697
addi x15, x29, 32 # perform operation
# Check if x15 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x15, "test_356")

# Testcase cp_imm_edges (imm = 64)
RVTEST_TESTDATA_LOAD_INT(x22, x24) # load rs1: x24 = 0x567420f6
addi x16, x24, 64 # perform operation
# Check if x16 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x16, "test_357")

# Testcase cp_imm_edges (imm = 128)
RVTEST_TESTDATA_LOAD_INT(x22, x31) # load rs1: x31 = 0xab4a521f
addi x2, x31, 128 # perform operation
# Check if x2 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x2, "test_358")

# Testcase cp_imm_edges (imm = 256)
RVTEST_TESTDATA_LOAD_INT(x22, x3) # load rs1: x3 = 0x1dbd152d
addi x25, x3, 256 # perform operation
# Check if x25 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x25, "test_359")

# Testcase cp_imm_edges (imm = 512)
RVTEST_TESTDATA_LOAD_INT(x22, x31) # load rs1: x31 = 0xef3eb1d9
addi x2, x31, 512 # perform operation
# Check if x2 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x2, "test_360")

# Testcase cp_imm_edges (imm = 1023)
RVTEST_TESTDATA_LOAD_INT(x22, x6) # load rs1: x6 = 0xda220de6
addi x3, x6, 1023 # perform operation
# Check if x3 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x3, "test_361")

# Testcase cp_imm_edges (imm = 1024)
RVTEST_TESTDATA_LOAD_INT(x22, x11) # load rs1: x11 = 0x0107d35b
addi x7, x11, 1024 # perform operation
# Check if x7 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x7, "test_362")

# Testcase cp_imm_edges (imm = 1795)
RVTEST_TESTDATA_LOAD_INT(x22, x10) # load rs1: x10 = 0x08ee1c06
addi x8, x10, 1795 # perform operation
# Check if x8 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x8, "test_363")

# Testcase cp_imm_edges (imm = 2047)
RVTEST_TESTDATA_LOAD_INT(x22, x19) # load rs1: x19 = 0x684c7ca0
addi x18, x19, 2047 # perform operation
# Check if x18 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x18, "test_364")

# Testcase cp_imm_edges (imm = -2048)
RVTEST_TESTDATA_LOAD_INT(x22, x2) # load rs1: x2 = 0x439af727
addi x3, x2, -2048 # perform operation
# Check if x3 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x3, "test_365")

# Testcase cp_imm_edges (imm = -2047)
RVTEST_TESTDATA_LOAD_INT(x22, x15) # load rs1: x15 = 0xefbc03ea
addi x3, x15, -2047 # perform operation
# Check if x3 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x3, "test_366")

# Testcase cp_imm_edges (imm = -2)
RVTEST_TESTDATA_LOAD_INT(x22, x16) # load rs1: x16 = 0xc837605e
addi x18, x16, -2 # perform operation
# Check if x18 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x18, "test_367")

# Testcase cp_imm_edges (imm = -1)
RVTEST_TESTDATA_LOAD_INT(x22, x6) # load rs1: x6 = 0xb2e0f6ef
addi x17, x6, -1 # perform operation
# Check if x17 contains the expected result. x9 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x9, x4, x5, x17, "test_368")


// Instantiate trap handlers and other epilog code, call RVMODEL_HALT at end of test
RVTEST_CODE_END

// Create scratch data sections and label for test data
RVTEST_DATA_BEGIN

    // Test data
    .word 0x05245fd3
    .word 0x18b7f774
    .word 0xa32a09f7
    .word 0x9cf1ef82
    .word 0xca7af0fe
    .word 0x1bb0bef9
    .word 0xf3793cc3
    .word 0xaf3dd45c
    .word 0x9b60f168
    .word 0xcf743e54
    .word 0x70ea0cc9
    .word 0x1753f9da
    .word 0x40f11b39
    .word 0xa00cbc8d
    .word 0x75750ad6
    .word 0x588f07b4
    .word 0x763b68b6
    .word 0xf578bf05
    .word 0xba248708
    .word 0xfca8ab12
    .word 0xf7e05b2e
    .word 0xd7d2059e
    .word 0xaa5e9e68
    .word 0x80ad83d3
    .word 0xadcb0de0
    .word 0x296e622d
    .word 0x1f5c7868
    .word 0x4c87ebba
    .word 0x299ffc3d
    .word 0xc8470859
    .word 0x8fc90337
    .word 0x96b4a195
    .word 0x08e9703f
    .word 0xa322e604
    .word 0x0be9d7a4
    .word 0x3615b581
    .word 0xb4cf6b77
    .word 0x3fef7926
    .word 0x332ceb48
    .word 0x121cb7c0
    .word 0x1ea0faf3
    .word 0x204ac672
    .word 0x52262a85
    .word 0xdff02d18
    .word 0x33f56cad
    .word 0xcf8d8128
    .word 0x10e841df
    .word 0x6007a32d
    .word 0x2202375e
    .word 0xafad6c85
    .word 0xc7857ba3
    .word 0xcec4e5b9
    .word 0x3b1e3d77
    .word 0x597fda7b
    .word 0x0af70b96
    .word 0x57ec10a2
    .word 0x8e598415
    .word 0xbbf1993a
    .word 0x350ddce0
    .word 0xddc01ebe
    .word 0xccdf9ef4
    .word 0xc0581916
    .word 0xe380e46f
    .word 0x1bfd803b
    .word 0x00000000
    .word 0x00000001
    .word 0x00000002
    .word 0x80000000
    .word 0x80000001
    .word 0x7fffffff
    .word 0x7ffffffe
    .word 0xffffffff
    .word 0xfffffffe
    .word 0x5bbc8872
    .word 0xaaaaaaaa
    .word 0x55555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x55555555
    .word 0x22ae8c27
    .word 0x2ca0964c
    .word 0x933bd420
    .word 0x43037f69
    .word 0x358a1d9d
    .word 0x7741da92
    .word 0x3ed4d086
    .word 0x4e18c5b3
    .word 0x9773ad5b
    .word 0xab1dde6e
    .word 0x86517846
    .word 0xf675bace
    .word 0x0c2933ad
    .word 0x482073a0
    .word 0xc5d616ed
    .word 0xc4457a0c
    .word 0x46206b37
    .word 0xd2324c5e
    .word 0xa7264cd8
    .word 0x48c91ef8
    .word 0x1ae8ab56
    .word 0x190c9629
    .word 0x0d102961
    .word 0x000f2075
    .word 0x75668d74
    .word 0xe02d511e
    .word 0x6732dc0d
    .word 0xa78a8eaa
    .word 0x0a68b9de
    .word 0xd48933f3
    .word 0x316d3323
    .word 0x41aa3c31
    .word 0xa0480c3e
    .word 0xfba68bf1
    .word 0xb16b2e5e
    .word 0x0271e71a
    .word 0x48650232
    .word 0xdb25ed37
    .word 0x1123e1ad
    .word 0xe9968697
    .word 0x567420f6
    .word 0xab4a521f
    .word 0x1dbd152d
    .word 0xef3eb1d9
    .word 0xda220de6
    .word 0x0107d35b
    .word 0x08ee1c06
    .word 0x684c7ca0
    .word 0x439af727
    .word 0xefbc03ea
    .word 0xc837605e
    .word 0xb2e0f6ef

    // Testcase strings
canary_mismatch: .string "Testcase signature canary mismatch!"
test_1: .string "\"test: 1; cp: I_addi_cg/cp_rs1\""
test_2: .string "\"test: 2; cp: I_addi_cg/cp_rs1\""
test_3: .string "\"test: 3; cp: I_addi_cg/cp_rs1\""
test_4: .string "\"test: 4; cp: I_addi_cg/cp_rs1\""
test_5: .string "\"test: 5; cp: I_addi_cg/cp_rs1\""
test_6: .string "\"test: 6; cp: I_addi_cg/cp_rs1\""
test_7: .string "\"test: 7; cp: I_addi_cg/cp_rs1\""
test_8: .string "\"test: 8; cp: I_addi_cg/cp_rs1\""
test_9: .string "\"test: 9; cp: I_addi_cg/cp_rs1\""
test_10: .string "\"test: 10; cp: I_addi_cg/cp_rs1\""
test_11: .string "\"test: 11; cp: I_addi_cg/cp_rs1\""
test_12: .string "\"test: 12; cp: I_addi_cg/cp_rs1\""
test_13: .string "\"test: 13; cp: I_addi_cg/cp_rs1\""
test_14: .string "\"test: 14; cp: I_addi_cg/cp_rs1\""
test_15: .string "\"test: 15; cp: I_addi_cg/cp_rs1\""
test_16: .string "\"test: 16; cp: I_addi_cg/cp_rs1\""
test_17: .string "\"test: 17; cp: I_addi_cg/cp_rs1\""
test_18: .string "\"test: 18; cp: I_addi_cg/cp_rs1\""
test_19: .string "\"test: 19; cp: I_addi_cg/cp_rs1\""
test_20: .string "\"test: 20; cp: I_addi_cg/cp_rs1\""
test_21: .string "\"test: 21; cp: I_addi_cg/cp_rs1\""
test_22: .string "\"test: 22; cp: I_addi_cg/cp_rs1\""
test_23: .string "\"test: 23; cp: I_addi_cg/cp_rs1\""
test_24: .string "\"test: 24; cp: I_addi_cg/cp_rs1\""
test_25: .string "\"test: 25; cp: I_addi_cg/cp_rs1\""
test_26: .string "\"test: 26; cp: I_addi_cg/cp_rs1\""
test_27: .string "\"test: 27; cp: I_addi_cg/cp_rs1\""
test_28: .string "\"test: 28; cp: I_addi_cg/cp_rs1\""
test_29: .string "\"test: 29; cp: I_addi_cg/cp_rs1\""
test_30: .string "\"test: 30; cp: I_addi_cg/cp_rs1\""
test_31: .string "\"test: 31; cp: I_addi_cg/cp_rs1\""
test_32: .string "\"test: 32; cp: I_addi_cg/cp_rs1\""
test_33: .string "\"test: 33; cp: I_addi_cg/cp_rd\""
test_34: .string "\"test: 34; cp: I_addi_cg/cp_rd\""
test_35: .string "\"test: 35; cp: I_addi_cg/cp_rd\""
test_36: .string "\"test: 36; cp: I_addi_cg/cp_rd\""
test_37: .string "\"test: 37; cp: I_addi_cg/cp_rd\""
test_38: .string "\"test: 38; cp: I_addi_cg/cp_rd\""
test_39: .string "\"test: 39; cp: I_addi_cg/cp_rd\""
test_40: .string "\"test: 40; cp: I_addi_cg/cp_rd\""
test_41: .string "\"test: 41; cp: I_addi_cg/cp_rd\""
test_42: .string "\"test: 42; cp: I_addi_cg/cp_rd\""
test_43: .string "\"test: 43; cp: I_addi_cg/cp_rd\""
test_44: .string "\"test: 44; cp: I_addi_cg/cp_rd\""
test_45: .string "\"test: 45; cp: I_addi_cg/cp_rd\""
test_46: .string "\"test: 46; cp: I_addi_cg/cp_rd\""
test_47: .string "\"test: 47; cp: I_addi_cg/cp_rd\""
test_48: .string "\"test: 48; cp: I_addi_cg/cp_rd\""
test_49: .string "\"test: 49; cp: I_addi_cg/cp_rd\""
test_50: .string "\"test: 50; cp: I_addi_cg/cp_rd\""
test_51: .string "\"test: 51; cp: I_addi_cg/cp_rd\""
test_52: .string "\"test: 52; cp: I_addi_cg/cp_rd\""
test_53: .string "\"test: 53; cp: I_addi_cg/cp_rd\""
test_54: .string "\"test: 54; cp: I_addi_cg/cp_rd\""
test_55: .string "\"test: 55; cp: I_addi_cg/cp_rd\""
test_56: .string "\"test: 56; cp: I_addi_cg/cp_rd\""
test_57: .string "\"test: 57; cp: I_addi_cg/cp_rd\""
test_58: .string "\"test: 58; cp: I_addi_cg/cp_rd\""
test_59: .string "\"test: 59; cp: I_addi_cg/cp_rd\""
test_60: .string "\"test: 60; cp: I_addi_cg/cp_rd\""
test_61: .string "\"test: 61; cp: I_addi_cg/cp_rd\""
test_62: .string "\"test: 62; cp: I_addi_cg/cp_rd\""
test_63: .string "\"test: 63; cp: I_addi_cg/cp_rd\""
test_64: .string "\"test: 64; cp: I_addi_cg/cp_rd\""
test_65: .string "\"test: 65; cp: I_addi_cg/cp_rs1_edges\""
test_66: .string "\"test: 66; cp: I_addi_cg/cp_rs1_edges\""
test_67: .string "\"test: 67; cp: I_addi_cg/cp_rs1_edges\""
test_68: .string "\"test: 68; cp: I_addi_cg/cp_rs1_edges\""
test_69: .string "\"test: 69; cp: I_addi_cg/cp_rs1_edges\""
test_70: .string "\"test: 70; cp: I_addi_cg/cp_rs1_edges\""
test_71: .string "\"test: 71; cp: I_addi_cg/cp_rs1_edges\""
test_72: .string "\"test: 72; cp: I_addi_cg/cp_rs1_edges\""
test_73: .string "\"test: 73; cp: I_addi_cg/cp_rs1_edges\""
test_74: .string "\"test: 74; cp: I_addi_cg/cp_rs1_edges\""
test_75: .string "\"test: 75; cp: I_addi_cg/cp_rs1_edges\""
test_76: .string "\"test: 76; cp: I_addi_cg/cp_rs1_edges\""
test_77: .string "\"test: 77; cp: I_addi_cg/cr_rs1_imm_edges\""
test_78: .string "\"test: 78; cp: I_addi_cg/cr_rs1_imm_edges\""
test_79: .string "\"test: 79; cp: I_addi_cg/cr_rs1_imm_edges\""
test_80: .string "\"test: 80; cp: I_addi_cg/cr_rs1_imm_edges\""
test_81: .string "\"test: 81; cp: I_addi_cg/cr_rs1_imm_edges\""
test_82: .string "\"test: 82; cp: I_addi_cg/cr_rs1_imm_edges\""
test_83: .string "\"test: 83; cp: I_addi_cg/cr_rs1_imm_edges\""
test_84: .string "\"test: 84; cp: I_addi_cg/cr_rs1_imm_edges\""
test_85: .string "\"test: 85; cp: I_addi_cg/cr_rs1_imm_edges\""
test_86: .string "\"test: 86; cp: I_addi_cg/cr_rs1_imm_edges\""
test_87: .string "\"test: 87; cp: I_addi_cg/cr_rs1_imm_edges\""
test_88: .string "\"test: 88; cp: I_addi_cg/cr_rs1_imm_edges\""
test_89: .string "\"test: 89; cp: I_addi_cg/cr_rs1_imm_edges\""
test_90: .string "\"test: 90; cp: I_addi_cg/cr_rs1_imm_edges\""
test_91: .string "\"test: 91; cp: I_addi_cg/cr_rs1_imm_edges\""
test_92: .string "\"test: 92; cp: I_addi_cg/cr_rs1_imm_edges\""
test_93: .string "\"test: 93; cp: I_addi_cg/cr_rs1_imm_edges\""
test_94: .string "\"test: 94; cp: I_addi_cg/cr_rs1_imm_edges\""
test_95: .string "\"test: 95; cp: I_addi_cg/cr_rs1_imm_edges\""
test_96: .string "\"test: 96; cp: I_addi_cg/cr_rs1_imm_edges\""
test_97: .string "\"test: 97; cp: I_addi_cg/cr_rs1_imm_edges\""
test_98: .string "\"test: 98; cp: I_addi_cg/cr_rs1_imm_edges\""
test_99: .string "\"test: 99; cp: I_addi_cg/cr_rs1_imm_edges\""
test_100: .string "\"test: 100; cp: I_addi_cg/cr_rs1_imm_edges\""
test_101: .string "\"test: 101; cp: I_addi_cg/cr_rs1_imm_edges\""
test_102: .string "\"test: 102; cp: I_addi_cg/cr_rs1_imm_edges\""
test_103: .string "\"test: 103; cp: I_addi_cg/cr_rs1_imm_edges\""
test_104: .string "\"test: 104; cp: I_addi_cg/cr_rs1_imm_edges\""
test_105: .string "\"test: 105; cp: I_addi_cg/cr_rs1_imm_edges\""
test_106: .string "\"test: 106; cp: I_addi_cg/cr_rs1_imm_edges\""
test_107: .string "\"test: 107; cp: I_addi_cg/cr_rs1_imm_edges\""
test_108: .string "\"test: 108; cp: I_addi_cg/cr_rs1_imm_edges\""
test_109: .string "\"test: 109; cp: I_addi_cg/cr_rs1_imm_edges\""
test_110: .string "\"test: 110; cp: I_addi_cg/cr_rs1_imm_edges\""
test_111: .string "\"test: 111; cp: I_addi_cg/cr_rs1_imm_edges\""
test_112: .string "\"test: 112; cp: I_addi_cg/cr_rs1_imm_edges\""
test_113: .string "\"test: 113; cp: I_addi_cg/cr_rs1_imm_edges\""
test_114: .string "\"test: 114; cp: I_addi_cg/cr_rs1_imm_edges\""
test_115: .string "\"test: 115; cp: I_addi_cg/cr_rs1_imm_edges\""
test_116: .string "\"test: 116; cp: I_addi_cg/cr_rs1_imm_edges\""
test_117: .string "\"test: 117; cp: I_addi_cg/cr_rs1_imm_edges\""
test_118: .string "\"test: 118; cp: I_addi_cg/cr_rs1_imm_edges\""
test_119: .string "\"test: 119; cp: I_addi_cg/cr_rs1_imm_edges\""
test_120: .string "\"test: 120; cp: I_addi_cg/cr_rs1_imm_edges\""
test_121: .string "\"test: 121; cp: I_addi_cg/cr_rs1_imm_edges\""
test_122: .string "\"test: 122; cp: I_addi_cg/cr_rs1_imm_edges\""
test_123: .string "\"test: 123; cp: I_addi_cg/cr_rs1_imm_edges\""
test_124: .string "\"test: 124; cp: I_addi_cg/cr_rs1_imm_edges\""
test_125: .string "\"test: 125; cp: I_addi_cg/cr_rs1_imm_edges\""
test_126: .string "\"test: 126; cp: I_addi_cg/cr_rs1_imm_edges\""
test_127: .string "\"test: 127; cp: I_addi_cg/cr_rs1_imm_edges\""
test_128: .string "\"test: 128; cp: I_addi_cg/cr_rs1_imm_edges\""
test_129: .string "\"test: 129; cp: I_addi_cg/cr_rs1_imm_edges\""
test_130: .string "\"test: 130; cp: I_addi_cg/cr_rs1_imm_edges\""
test_131: .string "\"test: 131; cp: I_addi_cg/cr_rs1_imm_edges\""
test_132: .string "\"test: 132; cp: I_addi_cg/cr_rs1_imm_edges\""
test_133: .string "\"test: 133; cp: I_addi_cg/cr_rs1_imm_edges\""
test_134: .string "\"test: 134; cp: I_addi_cg/cr_rs1_imm_edges\""
test_135: .string "\"test: 135; cp: I_addi_cg/cr_rs1_imm_edges\""
test_136: .string "\"test: 136; cp: I_addi_cg/cr_rs1_imm_edges\""
test_137: .string "\"test: 137; cp: I_addi_cg/cr_rs1_imm_edges\""
test_138: .string "\"test: 138; cp: I_addi_cg/cr_rs1_imm_edges\""
test_139: .string "\"test: 139; cp: I_addi_cg/cr_rs1_imm_edges\""
test_140: .string "\"test: 140; cp: I_addi_cg/cr_rs1_imm_edges\""
test_141: .string "\"test: 141; cp: I_addi_cg/cr_rs1_imm_edges\""
test_142: .string "\"test: 142; cp: I_addi_cg/cr_rs1_imm_edges\""
test_143: .string "\"test: 143; cp: I_addi_cg/cr_rs1_imm_edges\""
test_144: .string "\"test: 144; cp: I_addi_cg/cr_rs1_imm_edges\""
test_145: .string "\"test: 145; cp: I_addi_cg/cr_rs1_imm_edges\""
test_146: .string "\"test: 146; cp: I_addi_cg/cr_rs1_imm_edges\""
test_147: .string "\"test: 147; cp: I_addi_cg/cr_rs1_imm_edges\""
test_148: .string "\"test: 148; cp: I_addi_cg/cr_rs1_imm_edges\""
test_149: .string "\"test: 149; cp: I_addi_cg/cr_rs1_imm_edges\""
test_150: .string "\"test: 150; cp: I_addi_cg/cr_rs1_imm_edges\""
test_151: .string "\"test: 151; cp: I_addi_cg/cr_rs1_imm_edges\""
test_152: .string "\"test: 152; cp: I_addi_cg/cr_rs1_imm_edges\""
test_153: .string "\"test: 153; cp: I_addi_cg/cr_rs1_imm_edges\""
test_154: .string "\"test: 154; cp: I_addi_cg/cr_rs1_imm_edges\""
test_155: .string "\"test: 155; cp: I_addi_cg/cr_rs1_imm_edges\""
test_156: .string "\"test: 156; cp: I_addi_cg/cr_rs1_imm_edges\""
test_157: .string "\"test: 157; cp: I_addi_cg/cr_rs1_imm_edges\""
test_158: .string "\"test: 158; cp: I_addi_cg/cr_rs1_imm_edges\""
test_159: .string "\"test: 159; cp: I_addi_cg/cr_rs1_imm_edges\""
test_160: .string "\"test: 160; cp: I_addi_cg/cr_rs1_imm_edges\""
test_161: .string "\"test: 161; cp: I_addi_cg/cr_rs1_imm_edges\""
test_162: .string "\"test: 162; cp: I_addi_cg/cr_rs1_imm_edges\""
test_163: .string "\"test: 163; cp: I_addi_cg/cr_rs1_imm_edges\""
test_164: .string "\"test: 164; cp: I_addi_cg/cr_rs1_imm_edges\""
test_165: .string "\"test: 165; cp: I_addi_cg/cr_rs1_imm_edges\""
test_166: .string "\"test: 166; cp: I_addi_cg/cr_rs1_imm_edges\""
test_167: .string "\"test: 167; cp: I_addi_cg/cr_rs1_imm_edges\""
test_168: .string "\"test: 168; cp: I_addi_cg/cr_rs1_imm_edges\""
test_169: .string "\"test: 169; cp: I_addi_cg/cr_rs1_imm_edges\""
test_170: .string "\"test: 170; cp: I_addi_cg/cr_rs1_imm_edges\""
test_171: .string "\"test: 171; cp: I_addi_cg/cr_rs1_imm_edges\""
test_172: .string "\"test: 172; cp: I_addi_cg/cr_rs1_imm_edges\""
test_173: .string "\"test: 173; cp: I_addi_cg/cr_rs1_imm_edges\""
test_174: .string "\"test: 174; cp: I_addi_cg/cr_rs1_imm_edges\""
test_175: .string "\"test: 175; cp: I_addi_cg/cr_rs1_imm_edges\""
test_176: .string "\"test: 176; cp: I_addi_cg/cr_rs1_imm_edges\""
test_177: .string "\"test: 177; cp: I_addi_cg/cr_rs1_imm_edges\""
test_178: .string "\"test: 178; cp: I_addi_cg/cr_rs1_imm_edges\""
test_179: .string "\"test: 179; cp: I_addi_cg/cr_rs1_imm_edges\""
test_180: .string "\"test: 180; cp: I_addi_cg/cr_rs1_imm_edges\""
test_181: .string "\"test: 181; cp: I_addi_cg/cr_rs1_imm_edges\""
test_182: .string "\"test: 182; cp: I_addi_cg/cr_rs1_imm_edges\""
test_183: .string "\"test: 183; cp: I_addi_cg/cr_rs1_imm_edges\""
test_184: .string "\"test: 184; cp: I_addi_cg/cr_rs1_imm_edges\""
test_185: .string "\"test: 185; cp: I_addi_cg/cr_rs1_imm_edges\""
test_186: .string "\"test: 186; cp: I_addi_cg/cr_rs1_imm_edges\""
test_187: .string "\"test: 187; cp: I_addi_cg/cr_rs1_imm_edges\""
test_188: .string "\"test: 188; cp: I_addi_cg/cr_rs1_imm_edges\""
test_189: .string "\"test: 189; cp: I_addi_cg/cr_rs1_imm_edges\""
test_190: .string "\"test: 190; cp: I_addi_cg/cr_rs1_imm_edges\""
test_191: .string "\"test: 191; cp: I_addi_cg/cr_rs1_imm_edges\""
test_192: .string "\"test: 192; cp: I_addi_cg/cr_rs1_imm_edges\""
test_193: .string "\"test: 193; cp: I_addi_cg/cr_rs1_imm_edges\""
test_194: .string "\"test: 194; cp: I_addi_cg/cr_rs1_imm_edges\""
test_195: .string "\"test: 195; cp: I_addi_cg/cr_rs1_imm_edges\""
test_196: .string "\"test: 196; cp: I_addi_cg/cr_rs1_imm_edges\""
test_197: .string "\"test: 197; cp: I_addi_cg/cr_rs1_imm_edges\""
test_198: .string "\"test: 198; cp: I_addi_cg/cr_rs1_imm_edges\""
test_199: .string "\"test: 199; cp: I_addi_cg/cr_rs1_imm_edges\""
test_200: .string "\"test: 200; cp: I_addi_cg/cr_rs1_imm_edges\""
test_201: .string "\"test: 201; cp: I_addi_cg/cr_rs1_imm_edges\""
test_202: .string "\"test: 202; cp: I_addi_cg/cr_rs1_imm_edges\""
test_203: .string "\"test: 203; cp: I_addi_cg/cr_rs1_imm_edges\""
test_204: .string "\"test: 204; cp: I_addi_cg/cr_rs1_imm_edges\""
test_205: .string "\"test: 205; cp: I_addi_cg/cr_rs1_imm_edges\""
test_206: .string "\"test: 206; cp: I_addi_cg/cr_rs1_imm_edges\""
test_207: .string "\"test: 207; cp: I_addi_cg/cr_rs1_imm_edges\""
test_208: .string "\"test: 208; cp: I_addi_cg/cr_rs1_imm_edges\""
test_209: .string "\"test: 209; cp: I_addi_cg/cr_rs1_imm_edges\""
test_210: .string "\"test: 210; cp: I_addi_cg/cr_rs1_imm_edges\""
test_211: .string "\"test: 211; cp: I_addi_cg/cr_rs1_imm_edges\""
test_212: .string "\"test: 212; cp: I_addi_cg/cr_rs1_imm_edges\""
test_213: .string "\"test: 213; cp: I_addi_cg/cr_rs1_imm_edges\""
test_214: .string "\"test: 214; cp: I_addi_cg/cr_rs1_imm_edges\""
test_215: .string "\"test: 215; cp: I_addi_cg/cr_rs1_imm_edges\""
test_216: .string "\"test: 216; cp: I_addi_cg/cr_rs1_imm_edges\""
test_217: .string "\"test: 217; cp: I_addi_cg/cr_rs1_imm_edges\""
test_218: .string "\"test: 218; cp: I_addi_cg/cr_rs1_imm_edges\""
test_219: .string "\"test: 219; cp: I_addi_cg/cr_rs1_imm_edges\""
test_220: .string "\"test: 220; cp: I_addi_cg/cr_rs1_imm_edges\""
test_221: .string "\"test: 221; cp: I_addi_cg/cr_rs1_imm_edges\""
test_222: .string "\"test: 222; cp: I_addi_cg/cr_rs1_imm_edges\""
test_223: .string "\"test: 223; cp: I_addi_cg/cr_rs1_imm_edges\""
test_224: .string "\"test: 224; cp: I_addi_cg/cr_rs1_imm_edges\""
test_225: .string "\"test: 225; cp: I_addi_cg/cr_rs1_imm_edges\""
test_226: .string "\"test: 226; cp: I_addi_cg/cr_rs1_imm_edges\""
test_227: .string "\"test: 227; cp: I_addi_cg/cr_rs1_imm_edges\""
test_228: .string "\"test: 228; cp: I_addi_cg/cr_rs1_imm_edges\""
test_229: .string "\"test: 229; cp: I_addi_cg/cr_rs1_imm_edges\""
test_230: .string "\"test: 230; cp: I_addi_cg/cr_rs1_imm_edges\""
test_231: .string "\"test: 231; cp: I_addi_cg/cr_rs1_imm_edges\""
test_232: .string "\"test: 232; cp: I_addi_cg/cr_rs1_imm_edges\""
test_233: .string "\"test: 233; cp: I_addi_cg/cr_rs1_imm_edges\""
test_234: .string "\"test: 234; cp: I_addi_cg/cr_rs1_imm_edges\""
test_235: .string "\"test: 235; cp: I_addi_cg/cr_rs1_imm_edges\""
test_236: .string "\"test: 236; cp: I_addi_cg/cr_rs1_imm_edges\""
test_237: .string "\"test: 237; cp: I_addi_cg/cr_rs1_imm_edges\""
test_238: .string "\"test: 238; cp: I_addi_cg/cr_rs1_imm_edges\""
test_239: .string "\"test: 239; cp: I_addi_cg/cr_rs1_imm_edges\""
test_240: .string "\"test: 240; cp: I_addi_cg/cr_rs1_imm_edges\""
test_241: .string "\"test: 241; cp: I_addi_cg/cr_rs1_imm_edges\""
test_242: .string "\"test: 242; cp: I_addi_cg/cr_rs1_imm_edges\""
test_243: .string "\"test: 243; cp: I_addi_cg/cr_rs1_imm_edges\""
test_244: .string "\"test: 244; cp: I_addi_cg/cr_rs1_imm_edges\""
test_245: .string "\"test: 245; cp: I_addi_cg/cr_rs1_imm_edges\""
test_246: .string "\"test: 246; cp: I_addi_cg/cr_rs1_imm_edges\""
test_247: .string "\"test: 247; cp: I_addi_cg/cr_rs1_imm_edges\""
test_248: .string "\"test: 248; cp: I_addi_cg/cr_rs1_imm_edges\""
test_249: .string "\"test: 249; cp: I_addi_cg/cr_rs1_imm_edges\""
test_250: .string "\"test: 250; cp: I_addi_cg/cr_rs1_imm_edges\""
test_251: .string "\"test: 251; cp: I_addi_cg/cr_rs1_imm_edges\""
test_252: .string "\"test: 252; cp: I_addi_cg/cr_rs1_imm_edges\""
test_253: .string "\"test: 253; cp: I_addi_cg/cr_rs1_imm_edges\""
test_254: .string "\"test: 254; cp: I_addi_cg/cr_rs1_imm_edges\""
test_255: .string "\"test: 255; cp: I_addi_cg/cr_rs1_imm_edges\""
test_256: .string "\"test: 256; cp: I_addi_cg/cr_rs1_imm_edges\""
test_257: .string "\"test: 257; cp: I_addi_cg/cr_rs1_imm_edges\""
test_258: .string "\"test: 258; cp: I_addi_cg/cr_rs1_imm_edges\""
test_259: .string "\"test: 259; cp: I_addi_cg/cr_rs1_imm_edges\""
test_260: .string "\"test: 260; cp: I_addi_cg/cr_rs1_imm_edges\""
test_261: .string "\"test: 261; cp: I_addi_cg/cr_rs1_imm_edges\""
test_262: .string "\"test: 262; cp: I_addi_cg/cr_rs1_imm_edges\""
test_263: .string "\"test: 263; cp: I_addi_cg/cr_rs1_imm_edges\""
test_264: .string "\"test: 264; cp: I_addi_cg/cr_rs1_imm_edges\""
test_265: .string "\"test: 265; cp: I_addi_cg/cr_rs1_imm_edges\""
test_266: .string "\"test: 266; cp: I_addi_cg/cr_rs1_imm_edges\""
test_267: .string "\"test: 267; cp: I_addi_cg/cr_rs1_imm_edges\""
test_268: .string "\"test: 268; cp: I_addi_cg/cr_rs1_imm_edges\""
test_269: .string "\"test: 269; cp: I_addi_cg/cr_rs1_imm_edges\""
test_270: .string "\"test: 270; cp: I_addi_cg/cr_rs1_imm_edges\""
test_271: .string "\"test: 271; cp: I_addi_cg/cr_rs1_imm_edges\""
test_272: .string "\"test: 272; cp: I_addi_cg/cr_rs1_imm_edges\""
test_273: .string "\"test: 273; cp: I_addi_cg/cr_rs1_imm_edges\""
test_274: .string "\"test: 274; cp: I_addi_cg/cr_rs1_imm_edges\""
test_275: .string "\"test: 275; cp: I_addi_cg/cr_rs1_imm_edges\""
test_276: .string "\"test: 276; cp: I_addi_cg/cr_rs1_imm_edges\""
test_277: .string "\"test: 277; cp: I_addi_cg/cr_rs1_imm_edges\""
test_278: .string "\"test: 278; cp: I_addi_cg/cr_rs1_imm_edges\""
test_279: .string "\"test: 279; cp: I_addi_cg/cr_rs1_imm_edges\""
test_280: .string "\"test: 280; cp: I_addi_cg/cr_rs1_imm_edges\""
test_281: .string "\"test: 281; cp: I_addi_cg/cr_rs1_imm_edges\""
test_282: .string "\"test: 282; cp: I_addi_cg/cr_rs1_imm_edges\""
test_283: .string "\"test: 283; cp: I_addi_cg/cr_rs1_imm_edges\""
test_284: .string "\"test: 284; cp: I_addi_cg/cr_rs1_imm_edges\""
test_285: .string "\"test: 285; cp: I_addi_cg/cr_rs1_imm_edges\""
test_286: .string "\"test: 286; cp: I_addi_cg/cr_rs1_imm_edges\""
test_287: .string "\"test: 287; cp: I_addi_cg/cr_rs1_imm_edges\""
test_288: .string "\"test: 288; cp: I_addi_cg/cr_rs1_imm_edges\""
test_289: .string "\"test: 289; cp: I_addi_cg/cr_rs1_imm_edges\""
test_290: .string "\"test: 290; cp: I_addi_cg/cr_rs1_imm_edges\""
test_291: .string "\"test: 291; cp: I_addi_cg/cr_rs1_imm_edges\""
test_292: .string "\"test: 292; cp: I_addi_cg/cr_rs1_imm_edges\""
test_293: .string "\"test: 293; cp: I_addi_cg/cr_rs1_imm_edges\""
test_294: .string "\"test: 294; cp: I_addi_cg/cr_rs1_imm_edges\""
test_295: .string "\"test: 295; cp: I_addi_cg/cr_rs1_imm_edges\""
test_296: .string "\"test: 296; cp: I_addi_cg/cr_rs1_imm_edges\""
test_297: .string "\"test: 297; cp: I_addi_cg/cr_rs1_imm_edges\""
test_298: .string "\"test: 298; cp: I_addi_cg/cr_rs1_imm_edges\""
test_299: .string "\"test: 299; cp: I_addi_cg/cr_rs1_imm_edges\""
test_300: .string "\"test: 300; cp: I_addi_cg/cr_rs1_imm_edges\""
test_301: .string "\"test: 301; cp: I_addi_cg/cr_rs1_imm_edges\""
test_302: .string "\"test: 302; cp: I_addi_cg/cr_rs1_imm_edges\""
test_303: .string "\"test: 303; cp: I_addi_cg/cr_rs1_imm_edges\""
test_304: .string "\"test: 304; cp: I_addi_cg/cr_rs1_imm_edges\""
test_305: .string "\"test: 305; cp: I_addi_cg/cr_rs1_imm_edges\""
test_306: .string "\"test: 306; cp: I_addi_cg/cr_rs1_imm_edges\""
test_307: .string "\"test: 307; cp: I_addi_cg/cr_rs1_imm_edges\""
test_308: .string "\"test: 308; cp: I_addi_cg/cr_rs1_imm_edges\""
test_309: .string "\"test: 309; cp: I_addi_cg/cr_rs1_imm_edges\""
test_310: .string "\"test: 310; cp: I_addi_cg/cr_rs1_imm_edges\""
test_311: .string "\"test: 311; cp: I_addi_cg/cr_rs1_imm_edges\""
test_312: .string "\"test: 312; cp: I_addi_cg/cr_rs1_imm_edges\""
test_313: .string "\"test: 313; cp: I_addi_cg/cr_rs1_imm_edges\""
test_314: .string "\"test: 314; cp: I_addi_cg/cr_rs1_imm_edges\""
test_315: .string "\"test: 315; cp: I_addi_cg/cr_rs1_imm_edges\""
test_316: .string "\"test: 316; cp: I_addi_cg/cr_rs1_imm_edges\""
test_317: .string "\"test: 317; cp: I_addi_cg/cmp_rd_rs1\""
test_318: .string "\"test: 318; cp: I_addi_cg/cmp_rd_rs1\""
test_319: .string "\"test: 319; cp: I_addi_cg/cmp_rd_rs1\""
test_320: .string "\"test: 320; cp: I_addi_cg/cmp_rd_rs1\""
test_321: .string "\"test: 321; cp: I_addi_cg/cmp_rd_rs1\""
test_322: .string "\"test: 322; cp: I_addi_cg/cmp_rd_rs1\""
test_323: .string "\"test: 323; cp: I_addi_cg/cmp_rd_rs1\""
test_324: .string "\"test: 324; cp: I_addi_cg/cmp_rd_rs1\""
test_325: .string "\"test: 325; cp: I_addi_cg/cmp_rd_rs1\""
test_326: .string "\"test: 326; cp: I_addi_cg/cmp_rd_rs1\""
test_327: .string "\"test: 327; cp: I_addi_cg/cmp_rd_rs1\""
test_328: .string "\"test: 328; cp: I_addi_cg/cmp_rd_rs1\""
test_329: .string "\"test: 329; cp: I_addi_cg/cmp_rd_rs1\""
test_330: .string "\"test: 330; cp: I_addi_cg/cmp_rd_rs1\""
test_331: .string "\"test: 331; cp: I_addi_cg/cmp_rd_rs1\""
test_332: .string "\"test: 332; cp: I_addi_cg/cmp_rd_rs1\""
test_333: .string "\"test: 333; cp: I_addi_cg/cmp_rd_rs1\""
test_334: .string "\"test: 334; cp: I_addi_cg/cmp_rd_rs1\""
test_335: .string "\"test: 335; cp: I_addi_cg/cmp_rd_rs1\""
test_336: .string "\"test: 336; cp: I_addi_cg/cmp_rd_rs1\""
test_337: .string "\"test: 337; cp: I_addi_cg/cmp_rd_rs1\""
test_338: .string "\"test: 338; cp: I_addi_cg/cmp_rd_rs1\""
test_339: .string "\"test: 339; cp: I_addi_cg/cmp_rd_rs1\""
test_340: .string "\"test: 340; cp: I_addi_cg/cmp_rd_rs1\""
test_341: .string "\"test: 341; cp: I_addi_cg/cmp_rd_rs1\""
test_342: .string "\"test: 342; cp: I_addi_cg/cmp_rd_rs1\""
test_343: .string "\"test: 343; cp: I_addi_cg/cmp_rd_rs1\""
test_344: .string "\"test: 344; cp: I_addi_cg/cmp_rd_rs1\""
test_345: .string "\"test: 345; cp: I_addi_cg/cmp_rd_rs1\""
test_346: .string "\"test: 346; cp: I_addi_cg/cmp_rd_rs1\""
test_347: .string "\"test: 347; cp: I_addi_cg/cmp_rd_rs1\""
test_348: .string "\"test: 348; cp: I_addi_cg/cmp_rd_rs1\""
test_349: .string "\"test: 349; cp: I_addi_cg/cp_imm_edges\""
test_350: .string "\"test: 350; cp: I_addi_cg/cp_imm_edges\""
test_351: .string "\"test: 351; cp: I_addi_cg/cp_imm_edges\""
test_352: .string "\"test: 352; cp: I_addi_cg/cp_imm_edges\""
test_353: .string "\"test: 353; cp: I_addi_cg/cp_imm_edges\""
test_354: .string "\"test: 354; cp: I_addi_cg/cp_imm_edges\""
test_355: .string "\"test: 355; cp: I_addi_cg/cp_imm_edges\""
test_356: .string "\"test: 356; cp: I_addi_cg/cp_imm_edges\""
test_357: .string "\"test: 357; cp: I_addi_cg/cp_imm_edges\""
test_358: .string "\"test: 358; cp: I_addi_cg/cp_imm_edges\""
test_359: .string "\"test: 359; cp: I_addi_cg/cp_imm_edges\""
test_360: .string "\"test: 360; cp: I_addi_cg/cp_imm_edges\""
test_361: .string "\"test: 361; cp: I_addi_cg/cp_imm_edges\""
test_362: .string "\"test: 362; cp: I_addi_cg/cp_imm_edges\""
test_363: .string "\"test: 363; cp: I_addi_cg/cp_imm_edges\""
test_364: .string "\"test: 364; cp: I_addi_cg/cp_imm_edges\""
test_365: .string "\"test: 365; cp: I_addi_cg/cp_imm_edges\""
test_366: .string "\"test: 366; cp: I_addi_cg/cp_imm_edges\""
test_367: .string "\"test: 367; cp: I_addi_cg/cp_imm_edges\""
test_368: .string "\"test: 368; cp: I_addi_cg/cp_imm_edges\""

// End of test data section and model specific data
RVTEST_DATA_END

// Signature region for self-checking
RVTEST_SIG_SETUP
