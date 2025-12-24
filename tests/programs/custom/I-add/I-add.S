///////////////////////////////////////////
// rv32/I/I-add.S
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

#define TEST_FILE "I-add.S"
#define SIGUPD_COUNT 402
#include "riscv_arch_test.h"

# Set up test environment and declare main entry point
RVTEST_BEGIN



cp_rs1_tests:

# Testcase cp_rs1 (Test source rs1 = x0)
RVTEST_TESTDATA_LOAD_INT(x6, x0) # load rs1: x0 = 0xed199c2a
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0x3d120729
add x28, x0, x29 # perform operation
# Check if x28 contains the expected result. x3 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x3, x4, x5, x28, "test_1")

# Testcase cp_rs1 (Test source rs1 = x1)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0xf95ba545
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs2: x10 = 0x1f8b4c83
add x25, x1, x10 # perform operation
# Check if x25 contains the expected result. x3 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x3, x4, x5, x25, "test_2")

# Testcase cp_rs1 (Test source rs1 = x2)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0x117cfa69
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs2: x10 = 0x6b5ec0b1
add x30, x2, x10 # perform operation
# Check if x30 contains the expected result. x3 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x3, x4, x5, x30, "test_3")

mv x14, x3 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x3)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0xeec5c7fc
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0xd8483d27
add x26, x3, x22 # perform operation
# Check if x26 contains the expected result. x14 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x14, x4, x5, x26, "test_4")

mv x12, x4 # switch link pointer register to avoid conflict with test

mv x13, x5 # switch temp pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x4)
RVTEST_TESTDATA_LOAD_INT(x6, x4) # load rs1: x4 = 0xe637281b
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs2: x10 = 0xf420cbf4
add x17, x4, x10 # perform operation
# Check if x17 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x17, "test_5")

# Testcase cp_rs1 (Test source rs1 = x5)
RVTEST_TESTDATA_LOAD_INT(x6, x5) # load rs1: x5 = 0x26a21865
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs2: x26 = 0x5d018fe6
add x28, x5, x26 # perform operation
# Check if x28 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x28, "test_6")

mv x1, x6 # switch data pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x6)
RVTEST_TESTDATA_LOAD_INT(x1, x6) # load rs1: x6 = 0x876240f5
RVTEST_TESTDATA_LOAD_INT(x1, x16) # load rs2: x16 = 0xba52de6d
add x20, x6, x16 # perform operation
# Check if x20 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x20, "test_7")

# Testcase cp_rs1 (Test source rs1 = x7)
RVTEST_TESTDATA_LOAD_INT(x1, x7) # load rs1: x7 = 0x2d5aee8b
RVTEST_TESTDATA_LOAD_INT(x1, x27) # load rs2: x27 = 0x1856a7fa
add x26, x7, x27 # perform operation
# Check if x26 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x26, "test_8")

# Testcase cp_rs1 (Test source rs1 = x8)
RVTEST_TESTDATA_LOAD_INT(x1, x8) # load rs1: x8 = 0xd420d633
RVTEST_TESTDATA_LOAD_INT(x1, x4) # load rs2: x4 = 0xb57e79ab
add x26, x8, x4 # perform operation
# Check if x26 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x26, "test_9")

# Testcase cp_rs1 (Test source rs1 = x9)
RVTEST_TESTDATA_LOAD_INT(x1, x9) # load rs1: x9 = 0xb45312c3
RVTEST_TESTDATA_LOAD_INT(x1, x28) # load rs2: x28 = 0x802e5cbe
add x5, x9, x28 # perform operation
# Check if x5 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x5, "test_10")

# Testcase cp_rs1 (Test source rs1 = x10)
RVTEST_TESTDATA_LOAD_INT(x1, x10) # load rs1: x10 = 0x0f865f5c
RVTEST_TESTDATA_LOAD_INT(x1, x17) # load rs2: x17 = 0xa3a2996d
add x30, x10, x17 # perform operation
# Check if x30 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x30, "test_11")

# Testcase cp_rs1 (Test source rs1 = x11)
RVTEST_TESTDATA_LOAD_INT(x1, x11) # load rs1: x11 = 0xd06cfac9
RVTEST_TESTDATA_LOAD_INT(x1, x16) # load rs2: x16 = 0x7b11a602
add x10, x11, x16 # perform operation
# Check if x10 contains the expected result. x14 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x14, x12, x13, x10, "test_12")

mv x7, x12 # switch link pointer register to avoid conflict with test

mv x8, x13 # switch temp pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x12)
RVTEST_TESTDATA_LOAD_INT(x1, x12) # load rs1: x12 = 0x70a493f3
RVTEST_TESTDATA_LOAD_INT(x1, x13) # load rs2: x13 = 0xc758b40b
add x28, x12, x13 # perform operation
# Check if x28 contains the expected result. x14 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x14, x7, x8, x28, "test_13")

# Testcase cp_rs1 (Test source rs1 = x13)
RVTEST_TESTDATA_LOAD_INT(x1, x13) # load rs1: x13 = 0x40214e38
RVTEST_TESTDATA_LOAD_INT(x1, x21) # load rs2: x21 = 0x981d9fac
add x12, x13, x21 # perform operation
# Check if x12 contains the expected result. x14 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x14, x7, x8, x12, "test_14")

mv x29, x14 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x14)
RVTEST_TESTDATA_LOAD_INT(x1, x14) # load rs1: x14 = 0xde7d9301
RVTEST_TESTDATA_LOAD_INT(x1, x30) # load rs2: x30 = 0xfa1129a5
add x3, x14, x30 # perform operation
# Check if x3 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x3, "test_15")

# Testcase cp_rs1 (Test source rs1 = x15)
RVTEST_TESTDATA_LOAD_INT(x1, x15) # load rs1: x15 = 0x4afda77e
RVTEST_TESTDATA_LOAD_INT(x1, x3) # load rs2: x3 = 0x5cc11b57
add x27, x15, x3 # perform operation
# Check if x27 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x27, "test_16")

# Testcase cp_rs1 (Test source rs1 = x16)
RVTEST_TESTDATA_LOAD_INT(x1, x16) # load rs1: x16 = 0xbfb50e27
RVTEST_TESTDATA_LOAD_INT(x1, x24) # load rs2: x24 = 0xa2773413
add x26, x16, x24 # perform operation
# Check if x26 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x26, "test_17")

# Testcase cp_rs1 (Test source rs1 = x17)
RVTEST_TESTDATA_LOAD_INT(x1, x17) # load rs1: x17 = 0x1483c110
RVTEST_TESTDATA_LOAD_INT(x1, x14) # load rs2: x14 = 0x41796538
add x10, x17, x14 # perform operation
# Check if x10 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x10, "test_18")

# Testcase cp_rs1 (Test source rs1 = x18)
RVTEST_TESTDATA_LOAD_INT(x1, x18) # load rs1: x18 = 0xb0171db4
RVTEST_TESTDATA_LOAD_INT(x1, x3) # load rs2: x3 = 0x15685edf
add x23, x18, x3 # perform operation
# Check if x23 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x23, "test_19")

# Testcase cp_rs1 (Test source rs1 = x19)
RVTEST_TESTDATA_LOAD_INT(x1, x19) # load rs1: x19 = 0x372635c8
RVTEST_TESTDATA_LOAD_INT(x1, x11) # load rs2: x11 = 0xabe63122
add x0, x19, x11 # perform operation
# Check if x0 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x0, "test_20")

# Testcase cp_rs1 (Test source rs1 = x20)
RVTEST_TESTDATA_LOAD_INT(x1, x20) # load rs1: x20 = 0x17e1045d
RVTEST_TESTDATA_LOAD_INT(x1, x27) # load rs2: x27 = 0x36ec53d3
add x23, x20, x27 # perform operation
# Check if x23 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x23, "test_21")

# Testcase cp_rs1 (Test source rs1 = x21)
RVTEST_TESTDATA_LOAD_INT(x1, x21) # load rs1: x21 = 0xfbba752e
RVTEST_TESTDATA_LOAD_INT(x1, x5) # load rs2: x5 = 0xf0c74336
add x27, x21, x5 # perform operation
# Check if x27 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x27, "test_22")

# Testcase cp_rs1 (Test source rs1 = x22)
RVTEST_TESTDATA_LOAD_INT(x1, x22) # load rs1: x22 = 0xdb6f1137
RVTEST_TESTDATA_LOAD_INT(x1, x20) # load rs2: x20 = 0xc29ebecd
add x4, x22, x20 # perform operation
# Check if x4 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x4, "test_23")

# Testcase cp_rs1 (Test source rs1 = x23)
RVTEST_TESTDATA_LOAD_INT(x1, x23) # load rs1: x23 = 0x78e8edfc
RVTEST_TESTDATA_LOAD_INT(x1, x21) # load rs2: x21 = 0x5ccbb261
add x17, x23, x21 # perform operation
# Check if x17 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x17, "test_24")

# Testcase cp_rs1 (Test source rs1 = x24)
RVTEST_TESTDATA_LOAD_INT(x1, x24) # load rs1: x24 = 0xfed08e43
RVTEST_TESTDATA_LOAD_INT(x1, x3) # load rs2: x3 = 0x27bb3ee5
add x10, x24, x3 # perform operation
# Check if x10 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x10, "test_25")

# Testcase cp_rs1 (Test source rs1 = x25)
RVTEST_TESTDATA_LOAD_INT(x1, x25) # load rs1: x25 = 0x2abf7cf7
RVTEST_TESTDATA_LOAD_INT(x1, x6) # load rs2: x6 = 0x93f42a31
add x11, x25, x6 # perform operation
# Check if x11 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x11, "test_26")

# Testcase cp_rs1 (Test source rs1 = x26)
RVTEST_TESTDATA_LOAD_INT(x1, x26) # load rs1: x26 = 0xc3afbdd2
RVTEST_TESTDATA_LOAD_INT(x1, x24) # load rs2: x24 = 0xc71a0e78
add x9, x26, x24 # perform operation
# Check if x9 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x9, "test_27")

# Testcase cp_rs1 (Test source rs1 = x27)
RVTEST_TESTDATA_LOAD_INT(x1, x27) # load rs1: x27 = 0xffc9caef
RVTEST_TESTDATA_LOAD_INT(x1, x13) # load rs2: x13 = 0xabc8b3e9
add x18, x27, x13 # perform operation
# Check if x18 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x18, "test_28")

# Testcase cp_rs1 (Test source rs1 = x28)
RVTEST_TESTDATA_LOAD_INT(x1, x28) # load rs1: x28 = 0x540d414f
RVTEST_TESTDATA_LOAD_INT(x1, x31) # load rs2: x31 = 0x27de3f8b
add x2, x28, x31 # perform operation
# Check if x2 contains the expected result. x29 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x29, x7, x8, x2, "test_29")

mv x2, x29 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs1 (Test source rs1 = x29)
RVTEST_TESTDATA_LOAD_INT(x1, x29) # load rs1: x29 = 0x3af03ed8
RVTEST_TESTDATA_LOAD_INT(x1, x5) # load rs2: x5 = 0x82867701
add x28, x29, x5 # perform operation
# Check if x28 contains the expected result. x2 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x2, x7, x8, x28, "test_30")

# Testcase cp_rs1 (Test source rs1 = x30)
RVTEST_TESTDATA_LOAD_INT(x1, x30) # load rs1: x30 = 0x7d2eb89b
RVTEST_TESTDATA_LOAD_INT(x1, x17) # load rs2: x17 = 0x117b6f0f
add x15, x30, x17 # perform operation
# Check if x15 contains the expected result. x2 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x2, x7, x8, x15, "test_31")

# Testcase cp_rs1 (Test source rs1 = x31)
RVTEST_TESTDATA_LOAD_INT(x1, x31) # load rs1: x31 = 0xa9fe1b24
RVTEST_TESTDATA_LOAD_INT(x1, x25) # load rs2: x25 = 0xfdfb2019
add x28, x31, x25 # perform operation
# Check if x28 contains the expected result. x2 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x2, x7, x8, x28, "test_32")


cp_rs2_tests:

# Testcase cp_rs2 (Test source rs2 = x0)
RVTEST_TESTDATA_LOAD_INT(x1, x30) # load rs1: x30 = 0x3eaae683
RVTEST_TESTDATA_LOAD_INT(x1, x0) # load rs2: x0 = 0x067ee1d1
add x16, x30, x0 # perform operation
# Check if x16 contains the expected result. x2 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x2, x7, x8, x16, "test_33")

mv x21, x1 # switch data pointer register to avoid conflict with test

# Testcase cp_rs2 (Test source rs2 = x1)
RVTEST_TESTDATA_LOAD_INT(x21, x31) # load rs1: x31 = 0x7f3dab23
RVTEST_TESTDATA_LOAD_INT(x21, x1) # load rs2: x1 = 0x0281b902
add x27, x31, x1 # perform operation
# Check if x27 contains the expected result. x2 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x2, x7, x8, x27, "test_34")

mv x11, x2 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs2 (Test source rs2 = x2)
RVTEST_TESTDATA_LOAD_INT(x21, x13) # load rs1: x13 = 0x4ea14c52
RVTEST_TESTDATA_LOAD_INT(x21, x2) # load rs2: x2 = 0x2bde2cae
add x3, x13, x2 # perform operation
# Check if x3 contains the expected result. x11 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x11, x7, x8, x3, "test_35")

# Testcase cp_rs2 (Test source rs2 = x3)
RVTEST_TESTDATA_LOAD_INT(x21, x26) # load rs1: x26 = 0x94337b3a
RVTEST_TESTDATA_LOAD_INT(x21, x3) # load rs2: x3 = 0x2fab724e
add x19, x26, x3 # perform operation
# Check if x19 contains the expected result. x11 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x11, x7, x8, x19, "test_36")

# Testcase cp_rs2 (Test source rs2 = x4)
RVTEST_TESTDATA_LOAD_INT(x21, x13) # load rs1: x13 = 0xb44bf23a
RVTEST_TESTDATA_LOAD_INT(x21, x4) # load rs2: x4 = 0xa4e1b102
add x12, x13, x4 # perform operation
# Check if x12 contains the expected result. x11 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x11, x7, x8, x12, "test_37")

# Testcase cp_rs2 (Test source rs2 = x5)
RVTEST_TESTDATA_LOAD_INT(x21, x1) # load rs1: x1 = 0x3b9b6e94
RVTEST_TESTDATA_LOAD_INT(x21, x5) # load rs2: x5 = 0xc836c192
add x22, x1, x5 # perform operation
# Check if x22 contains the expected result. x11 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x11, x7, x8, x22, "test_38")

# Testcase cp_rs2 (Test source rs2 = x6)
RVTEST_TESTDATA_LOAD_INT(x21, x29) # load rs1: x29 = 0x3b5d0235
RVTEST_TESTDATA_LOAD_INT(x21, x6) # load rs2: x6 = 0xd926fe45
add x5, x29, x6 # perform operation
# Check if x5 contains the expected result. x11 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x11, x7, x8, x5, "test_39")

mv x12, x7 # switch link pointer register to avoid conflict with test

mv x13, x8 # switch temp pointer register to avoid conflict with test

# Testcase cp_rs2 (Test source rs2 = x7)
RVTEST_TESTDATA_LOAD_INT(x21, x22) # load rs1: x22 = 0x0818ebd1
RVTEST_TESTDATA_LOAD_INT(x21, x7) # load rs2: x7 = 0x4e48467d
add x27, x22, x7 # perform operation
# Check if x27 contains the expected result. x11 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x11, x12, x13, x27, "test_40")

# Testcase cp_rs2 (Test source rs2 = x8)
RVTEST_TESTDATA_LOAD_INT(x21, x18) # load rs1: x18 = 0x3bf88405
RVTEST_TESTDATA_LOAD_INT(x21, x8) # load rs2: x8 = 0xb4a1a140
add x0, x18, x8 # perform operation
# Check if x0 contains the expected result. x11 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x11, x12, x13, x0, "test_41")

# Testcase cp_rs2 (Test source rs2 = x9)
RVTEST_TESTDATA_LOAD_INT(x21, x30) # load rs1: x30 = 0xde44271a
RVTEST_TESTDATA_LOAD_INT(x21, x9) # load rs2: x9 = 0x8940d7c5
add x17, x30, x9 # perform operation
# Check if x17 contains the expected result. x11 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x11, x12, x13, x17, "test_42")

# Testcase cp_rs2 (Test source rs2 = x10)
RVTEST_TESTDATA_LOAD_INT(x21, x1) # load rs1: x1 = 0xe32c4825
RVTEST_TESTDATA_LOAD_INT(x21, x10) # load rs2: x10 = 0x7cc721c3
add x30, x1, x10 # perform operation
# Check if x30 contains the expected result. x11 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x11, x12, x13, x30, "test_43")

mv x10, x11 # switch signature pointer register to avoid conflict with test

# Testcase cp_rs2 (Test source rs2 = x11)
RVTEST_TESTDATA_LOAD_INT(x21, x23) # load rs1: x23 = 0x5f0316e5
RVTEST_TESTDATA_LOAD_INT(x21, x11) # load rs2: x11 = 0x928e3c15
add x8, x23, x11 # perform operation
# Check if x8 contains the expected result. x10 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x10, x12, x13, x8, "test_44")

mv x7, x12 # switch link pointer register to avoid conflict with test

mv x8, x13 # switch temp pointer register to avoid conflict with test

# Testcase cp_rs2 (Test source rs2 = x12)
RVTEST_TESTDATA_LOAD_INT(x21, x16) # load rs1: x16 = 0x74d30640
RVTEST_TESTDATA_LOAD_INT(x21, x12) # load rs2: x12 = 0x4fc8a7d6
add x14, x16, x12 # perform operation
# Check if x14 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x14, "test_45")

# Testcase cp_rs2 (Test source rs2 = x13)
RVTEST_TESTDATA_LOAD_INT(x21, x17) # load rs1: x17 = 0xc7ad9342
RVTEST_TESTDATA_LOAD_INT(x21, x13) # load rs2: x13 = 0xf7671b93
add x31, x17, x13 # perform operation
# Check if x31 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x31, "test_46")

# Testcase cp_rs2 (Test source rs2 = x14)
RVTEST_TESTDATA_LOAD_INT(x21, x25) # load rs1: x25 = 0x26dd3cfe
RVTEST_TESTDATA_LOAD_INT(x21, x14) # load rs2: x14 = 0x6b996319
add x28, x25, x14 # perform operation
# Check if x28 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x28, "test_47")

# Testcase cp_rs2 (Test source rs2 = x15)
RVTEST_TESTDATA_LOAD_INT(x21, x27) # load rs1: x27 = 0xfb73cb6c
RVTEST_TESTDATA_LOAD_INT(x21, x15) # load rs2: x15 = 0x4141f5f9
add x6, x27, x15 # perform operation
# Check if x6 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x6, "test_48")

# Testcase cp_rs2 (Test source rs2 = x16)
RVTEST_TESTDATA_LOAD_INT(x21, x9) # load rs1: x9 = 0x05cc7e6b
RVTEST_TESTDATA_LOAD_INT(x21, x16) # load rs2: x16 = 0xb757937f
add x31, x9, x16 # perform operation
# Check if x31 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x31, "test_49")

# Testcase cp_rs2 (Test source rs2 = x17)
RVTEST_TESTDATA_LOAD_INT(x21, x5) # load rs1: x5 = 0xb15b6fef
RVTEST_TESTDATA_LOAD_INT(x21, x17) # load rs2: x17 = 0xc7966030
add x13, x5, x17 # perform operation
# Check if x13 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x13, "test_50")

# Testcase cp_rs2 (Test source rs2 = x18)
RVTEST_TESTDATA_LOAD_INT(x21, x14) # load rs1: x14 = 0xa4571a9b
RVTEST_TESTDATA_LOAD_INT(x21, x18) # load rs2: x18 = 0x3f00be87
add x16, x14, x18 # perform operation
# Check if x16 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x16, "test_51")

# Testcase cp_rs2 (Test source rs2 = x19)
RVTEST_TESTDATA_LOAD_INT(x21, x5) # load rs1: x5 = 0xbce3e7fb
RVTEST_TESTDATA_LOAD_INT(x21, x19) # load rs2: x19 = 0xeeda0414
add x11, x5, x19 # perform operation
# Check if x11 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x11, "test_52")

# Testcase cp_rs2 (Test source rs2 = x20)
RVTEST_TESTDATA_LOAD_INT(x21, x17) # load rs1: x17 = 0x7006b21d
RVTEST_TESTDATA_LOAD_INT(x21, x20) # load rs2: x20 = 0x9f384bd6
add x13, x17, x20 # perform operation
# Check if x13 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x13, "test_53")

mv x17, x21 # switch data pointer register to avoid conflict with test

# Testcase cp_rs2 (Test source rs2 = x21)
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs1: x30 = 0xb17b9ef4
RVTEST_TESTDATA_LOAD_INT(x17, x21) # load rs2: x21 = 0xad0e914a
add x11, x30, x21 # perform operation
# Check if x11 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x11, "test_54")

# Testcase cp_rs2 (Test source rs2 = x22)
RVTEST_TESTDATA_LOAD_INT(x17, x20) # load rs1: x20 = 0xd639a8ad
RVTEST_TESTDATA_LOAD_INT(x17, x22) # load rs2: x22 = 0xf83a4f86
add x2, x20, x22 # perform operation
# Check if x2 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x2, "test_55")

# Testcase cp_rs2 (Test source rs2 = x23)
RVTEST_TESTDATA_LOAD_INT(x17, x22) # load rs1: x22 = 0x4a9cd9de
RVTEST_TESTDATA_LOAD_INT(x17, x23) # load rs2: x23 = 0x714599fc
add x30, x22, x23 # perform operation
# Check if x30 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x30, "test_56")

# Testcase cp_rs2 (Test source rs2 = x24)
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs1: x30 = 0xf21bdfcf
RVTEST_TESTDATA_LOAD_INT(x17, x24) # load rs2: x24 = 0xa93f47cc
add x27, x30, x24 # perform operation
# Check if x27 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x27, "test_57")

# Testcase cp_rs2 (Test source rs2 = x25)
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs1: x30 = 0x5fcf6182
RVTEST_TESTDATA_LOAD_INT(x17, x25) # load rs2: x25 = 0x07d2aa1e
add x12, x30, x25 # perform operation
# Check if x12 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x12, "test_58")

# Testcase cp_rs2 (Test source rs2 = x26)
RVTEST_TESTDATA_LOAD_INT(x17, x27) # load rs1: x27 = 0xda7f969f
RVTEST_TESTDATA_LOAD_INT(x17, x26) # load rs2: x26 = 0xbcef98f6
add x29, x27, x26 # perform operation
# Check if x29 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x29, "test_59")

# Testcase cp_rs2 (Test source rs2 = x27)
RVTEST_TESTDATA_LOAD_INT(x17, x12) # load rs1: x12 = 0xccb5eb7b
RVTEST_TESTDATA_LOAD_INT(x17, x27) # load rs2: x27 = 0xe2485bb0
add x23, x12, x27 # perform operation
# Check if x23 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x23, "test_60")

# Testcase cp_rs2 (Test source rs2 = x28)
RVTEST_TESTDATA_LOAD_INT(x17, x14) # load rs1: x14 = 0x971ed8e8
RVTEST_TESTDATA_LOAD_INT(x17, x28) # load rs2: x28 = 0xbf9abc66
add x18, x14, x28 # perform operation
# Check if x18 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x18, "test_61")

# Testcase cp_rs2 (Test source rs2 = x29)
RVTEST_TESTDATA_LOAD_INT(x17, x24) # load rs1: x24 = 0x0217fb16
RVTEST_TESTDATA_LOAD_INT(x17, x29) # load rs2: x29 = 0x46b6bde5
add x5, x24, x29 # perform operation
# Check if x5 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x5, "test_62")

# Testcase cp_rs2 (Test source rs2 = x30)
RVTEST_TESTDATA_LOAD_INT(x17, x15) # load rs1: x15 = 0x14f03448
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs2: x30 = 0x62a240ed
add x12, x15, x30 # perform operation
# Check if x12 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x12, "test_63")

# Testcase cp_rs2 (Test source rs2 = x31)
RVTEST_TESTDATA_LOAD_INT(x17, x14) # load rs1: x14 = 0x0aac8f33
RVTEST_TESTDATA_LOAD_INT(x17, x31) # load rs2: x31 = 0xd5fe5f7c
add x30, x14, x31 # perform operation
# Check if x30 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x30, "test_64")


cp_rd_tests:

# Testcase cp_rd (Test destination rd = x0)
RVTEST_TESTDATA_LOAD_INT(x17, x23) # load rs1: x23 = 0xc1d58273
RVTEST_TESTDATA_LOAD_INT(x17, x4) # load rs2: x4 = 0xe7ceb07b
add x0, x23, x4 # perform operation
# Check if x0 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x0, "test_65")

# Testcase cp_rd (Test destination rd = x1)
RVTEST_TESTDATA_LOAD_INT(x17, x29) # load rs1: x29 = 0x9bfbf146
RVTEST_TESTDATA_LOAD_INT(x17, x25) # load rs2: x25 = 0xf9444983
add x1, x29, x25 # perform operation
# Check if x1 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x1, "test_66")

# Testcase cp_rd (Test destination rd = x2)
RVTEST_TESTDATA_LOAD_INT(x17, x27) # load rs1: x27 = 0x13190cdb
RVTEST_TESTDATA_LOAD_INT(x17, x31) # load rs2: x31 = 0x1796c960
add x2, x27, x31 # perform operation
# Check if x2 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x2, "test_67")

# Testcase cp_rd (Test destination rd = x3)
RVTEST_TESTDATA_LOAD_INT(x17, x4) # load rs1: x4 = 0x9f8773de
RVTEST_TESTDATA_LOAD_INT(x17, x29) # load rs2: x29 = 0x186da37b
add x3, x4, x29 # perform operation
# Check if x3 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x3, "test_68")

# Testcase cp_rd (Test destination rd = x4)
RVTEST_TESTDATA_LOAD_INT(x17, x20) # load rs1: x20 = 0xf1da32b9
RVTEST_TESTDATA_LOAD_INT(x17, x18) # load rs2: x18 = 0x3f9d2b53
add x4, x20, x18 # perform operation
# Check if x4 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x4, "test_69")

# Testcase cp_rd (Test destination rd = x5)
RVTEST_TESTDATA_LOAD_INT(x17, x16) # load rs1: x16 = 0xfcc9c425
RVTEST_TESTDATA_LOAD_INT(x17, x2) # load rs2: x2 = 0xb8a9e200
add x5, x16, x2 # perform operation
# Check if x5 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x5, "test_70")

# Testcase cp_rd (Test destination rd = x6)
RVTEST_TESTDATA_LOAD_INT(x17, x28) # load rs1: x28 = 0x7f142f3d
RVTEST_TESTDATA_LOAD_INT(x17, x14) # load rs2: x14 = 0x0c2a6a82
add x6, x28, x14 # perform operation
# Check if x6 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x6, "test_71")

mv x4, x7 # switch link pointer register to avoid conflict with test

mv x5, x8 # switch temp pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x7)
RVTEST_TESTDATA_LOAD_INT(x17, x19) # load rs1: x19 = 0xb30ad053
RVTEST_TESTDATA_LOAD_INT(x17, x21) # load rs2: x21 = 0xa622a84c
add x7, x19, x21 # perform operation
# Check if x7 contains the expected result. x10 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x10, x4, x5, x7, "test_72")

# Testcase cp_rd (Test destination rd = x8)
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs1: x30 = 0xc4d6907c
RVTEST_TESTDATA_LOAD_INT(x17, x20) # load rs2: x20 = 0x8fde06b7
add x8, x30, x20 # perform operation
# Check if x8 contains the expected result. x10 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x10, x4, x5, x8, "test_73")

# Testcase cp_rd (Test destination rd = x9)
RVTEST_TESTDATA_LOAD_INT(x17, x20) # load rs1: x20 = 0x3188fc69
RVTEST_TESTDATA_LOAD_INT(x17, x29) # load rs2: x29 = 0xad50d179
add x9, x20, x29 # perform operation
# Check if x9 contains the expected result. x10 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x10, x4, x5, x9, "test_74")

mv x27, x10 # switch signature pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x10)
RVTEST_TESTDATA_LOAD_INT(x17, x31) # load rs1: x31 = 0x620b6023
RVTEST_TESTDATA_LOAD_INT(x17, x3) # load rs2: x3 = 0x698be42b
add x10, x31, x3 # perform operation
# Check if x10 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x10, "test_75")

# Testcase cp_rd (Test destination rd = x11)
RVTEST_TESTDATA_LOAD_INT(x17, x10) # load rs1: x10 = 0xf21e100d
RVTEST_TESTDATA_LOAD_INT(x17, x8) # load rs2: x8 = 0xf30d76e6
add x11, x10, x8 # perform operation
# Check if x11 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x11, "test_76")

# Testcase cp_rd (Test destination rd = x12)
RVTEST_TESTDATA_LOAD_INT(x17, x9) # load rs1: x9 = 0x71a7383d
RVTEST_TESTDATA_LOAD_INT(x17, x23) # load rs2: x23 = 0x86e9a98e
add x12, x9, x23 # perform operation
# Check if x12 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x12, "test_77")

# Testcase cp_rd (Test destination rd = x13)
RVTEST_TESTDATA_LOAD_INT(x17, x16) # load rs1: x16 = 0x18fdab72
RVTEST_TESTDATA_LOAD_INT(x17, x0) # load rs2: x0 = 0xea2ffa7b
add x13, x16, x0 # perform operation
# Check if x13 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x13, "test_78")

# Testcase cp_rd (Test destination rd = x14)
RVTEST_TESTDATA_LOAD_INT(x17, x12) # load rs1: x12 = 0x04507ba2
RVTEST_TESTDATA_LOAD_INT(x17, x22) # load rs2: x22 = 0xe1e6daa3
add x14, x12, x22 # perform operation
# Check if x14 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x14, "test_79")

# Testcase cp_rd (Test destination rd = x15)
RVTEST_TESTDATA_LOAD_INT(x17, x3) # load rs1: x3 = 0xb35c3576
RVTEST_TESTDATA_LOAD_INT(x17, x16) # load rs2: x16 = 0xb937f0d5
add x15, x3, x16 # perform operation
# Check if x15 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x15, "test_80")

# Testcase cp_rd (Test destination rd = x16)
RVTEST_TESTDATA_LOAD_INT(x17, x21) # load rs1: x21 = 0x9d1babbf
RVTEST_TESTDATA_LOAD_INT(x17, x15) # load rs2: x15 = 0x9519d114
add x16, x21, x15 # perform operation
# Check if x16 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x16, "test_81")

mv x24, x17 # switch data pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x17)
RVTEST_TESTDATA_LOAD_INT(x24, x2) # load rs1: x2 = 0xabed9793
RVTEST_TESTDATA_LOAD_INT(x24, x11) # load rs2: x11 = 0x30c5d011
add x17, x2, x11 # perform operation
# Check if x17 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x17, "test_82")

# Testcase cp_rd (Test destination rd = x18)
RVTEST_TESTDATA_LOAD_INT(x24, x28) # load rs1: x28 = 0xbf25b0d1
RVTEST_TESTDATA_LOAD_INT(x24, x6) # load rs2: x6 = 0xf8b159f8
add x18, x28, x6 # perform operation
# Check if x18 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x18, "test_83")

# Testcase cp_rd (Test destination rd = x19)
RVTEST_TESTDATA_LOAD_INT(x24, x7) # load rs1: x7 = 0x906c4f43
RVTEST_TESTDATA_LOAD_INT(x24, x26) # load rs2: x26 = 0x56fa2832
add x19, x7, x26 # perform operation
# Check if x19 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x19, "test_84")

# Testcase cp_rd (Test destination rd = x20)
RVTEST_TESTDATA_LOAD_INT(x24, x29) # load rs1: x29 = 0xd70241be
RVTEST_TESTDATA_LOAD_INT(x24, x22) # load rs2: x22 = 0x49bf4fdf
add x20, x29, x22 # perform operation
# Check if x20 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x20, "test_85")

# Testcase cp_rd (Test destination rd = x21)
RVTEST_TESTDATA_LOAD_INT(x24, x19) # load rs1: x19 = 0xa3153a0c
RVTEST_TESTDATA_LOAD_INT(x24, x15) # load rs2: x15 = 0xefcb5221
add x21, x19, x15 # perform operation
# Check if x21 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x21, "test_86")

# Testcase cp_rd (Test destination rd = x22)
RVTEST_TESTDATA_LOAD_INT(x24, x19) # load rs1: x19 = 0xf2af9519
RVTEST_TESTDATA_LOAD_INT(x24, x9) # load rs2: x9 = 0xfea8bcb4
add x22, x19, x9 # perform operation
# Check if x22 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x22, "test_87")

# Testcase cp_rd (Test destination rd = x23)
RVTEST_TESTDATA_LOAD_INT(x24, x21) # load rs1: x21 = 0xf4430e4b
RVTEST_TESTDATA_LOAD_INT(x24, x29) # load rs2: x29 = 0x886a1096
add x23, x21, x29 # perform operation
# Check if x23 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x23, "test_88")

mv x6, x24 # switch data pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x24)
RVTEST_TESTDATA_LOAD_INT(x6, x31) # load rs1: x31 = 0x2bd547b5
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs2: x14 = 0xf61853a8
add x24, x31, x14 # perform operation
# Check if x24 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x24, "test_89")

# Testcase cp_rd (Test destination rd = x25)
RVTEST_TESTDATA_LOAD_INT(x6, x0) # load rs1: x0 = 0xdb6e0539
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0x90cf6c7c
add x25, x0, x16 # perform operation
# Check if x25 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x25, "test_90")

# Testcase cp_rd (Test destination rd = x26)
RVTEST_TESTDATA_LOAD_INT(x6, x25) # load rs1: x25 = 0xd14f98d9
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0xa9de691f
add x26, x25, x16 # perform operation
# Check if x26 contains the expected result. x27 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x27, x4, x5, x26, "test_91")

mv x25, x27 # switch signature pointer register to avoid conflict with test

# Testcase cp_rd (Test destination rd = x27)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0xcd82a97a
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs2: x19 = 0xdb55bce6
add x27, x22, x19 # perform operation
# Check if x27 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x27, "test_92")

# Testcase cp_rd (Test destination rd = x28)
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs1: x29 = 0xb83d042f
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs2: x1 = 0x8b7b7bd7
add x28, x29, x1 # perform operation
# Check if x28 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x28, "test_93")

# Testcase cp_rd (Test destination rd = x29)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0x21ccba0d
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0xa01edcfa
add x29, x22, x11 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_94")

# Testcase cp_rd (Test destination rd = x30)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0x3350bfef
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0xaed9ac00
add x30, x19, x29 # perform operation
# Check if x30 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x30, "test_95")

# Testcase cp_rd (Test destination rd = x31)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0x789baf59
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs2: x28 = 0xb9fa9f15
add x31, x10, x28 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_96")


cp_rs1_edges_tests:

# Testcase cp_rs1_edges (Test source rs1 value = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0xc03744aa
add x3, x14, x23 # perform operation
# Check if x3 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x3, "test_97")

# Testcase cp_rs1_edges (Test source rs1 value = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs1: x29 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs2: x9 = 0xe2f82790
add x15, x29, x9 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_98")

# Testcase cp_rs1_edges (Test source rs1 value = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x73426dce
add x15, x2, x20 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_99")

# Testcase cp_rs1_edges (Test source rs1 value = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0xa3b9ae23
add x13, x27, x3 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_100")

# Testcase cp_rs1_edges (Test source rs1 value = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0xd7f4336f
add x11, x21, x23 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_101")

# Testcase cp_rs1_edges (Test source rs1 value = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0x14718a3d
add x13, x27, x21 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_102")

# Testcase cp_rs1_edges (Test source rs1 value = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs2: x13 = 0x0fb1f161
add x7, x16, x13 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_103")

# Testcase cp_rs1_edges (Test source rs1 value = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs1: x13 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs2: x26 = 0x0c446dc3
add x28, x13, x26 # perform operation
# Check if x28 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x28, "test_104")

# Testcase cp_rs1_edges (Test source rs1 value = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs2: x30 = 0xfa02b496
add x12, x10, x30 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_105")

# Testcase cp_rs1_edges (Test source rs1 value = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0xee925035
add x30, x28, x16 # perform operation
# Check if x30 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x30, "test_106")

# Testcase cp_rs1_edges (Test source rs1 value = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0x81ad3590
add x17, x10, x11 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_107")

# Testcase cp_rs1_edges (Test source rs1 value = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0x125b9407
add x21, x11, x29 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_108")


cp_rs2_edges_tests:

# Testcase cp_rs2_edges (Test source rs2 value = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0xf98291ee
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x00000000
add x15, x7, x24 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_109")

# Testcase cp_rs2_edges (Test source rs2 value = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs1: x8 = 0x92be3f2b
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x00000001
add x9, x8, x22 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_110")

# Testcase cp_rs2_edges (Test source rs2 value = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0x30a1dae4
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x00000002
add x31, x11, x22 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_111")

# Testcase cp_rs2_edges (Test source rs2 value = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs1: x29 = 0x730a6ae4
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0x80000000
add x17, x29, x21 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_112")

# Testcase cp_rs2_edges (Test source rs2 value = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0x1e214dd4
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs2: x9 = 0x80000001
add x20, x22, x9 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x20, "test_113")

# Testcase cp_rs2_edges (Test source rs2 value = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0xb4de2b95
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs2: x1 = 0x7fffffff
add x26, x19, x1 # perform operation
# Check if x26 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x26, "test_114")

# Testcase cp_rs2_edges (Test source rs2 value = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0x6b0265a5
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x7ffffffe
add x31, x21, x20 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_115")

# Testcase cp_rs2_edges (Test source rs2 value = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs1: x29 = 0x50ece1cc
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs2: x2 = 0xffffffff
add x18, x29, x2 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_116")

# Testcase cp_rs2_edges (Test source rs2 value = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs1: x12 = 0x4bb5f25c
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0xfffffffe
add x28, x12, x23 # perform operation
# Check if x28 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x28, "test_117")

# Testcase cp_rs2_edges (Test source rs2 value = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0xd857328e
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0x5bbc8872
add x11, x3, x16 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_118")

# Testcase cp_rs2_edges (Test source rs2 value = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x0556e722
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0xaaaaaaaa
add x21, x26, x12 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_119")

# Testcase cp_rs2_edges (Test source rs2 value = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0x00927107
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs2: x19 = 0x55555555
add x29, x22, x19 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_120")


cr_rs1_rs2_edges_tests:

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x00000000
add x11, x22, x20 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_121")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x00000001
add x18, x2, x27 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_122")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x00000002
add x23, x28, x24 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_123")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs1: x17 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x80000000
add x7, x17, x22 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_124")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0x80000001
add x31, x16, x12 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_125")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs1: x12 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x7fffffff
add x9, x12, x24 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_126")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x7ffffffe
add x13, x1, x20 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_127")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs2: x18 = 0xffffffff
add x20, x7, x18 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x20, "test_128")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0xfffffffe
add x22, x24, x11 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_129")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x5bbc8872
add x21, x16, x8 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_130")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0xaaaaaaaa
add x12, x24, x17 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_131")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000000 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x00000000
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0x55555555
add x24, x27, x23 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_132")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x31) # load rs2: x31 = 0x00000000
add x9, x15, x31 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_133")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs1: x20 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs2: x15 = 0x00000001
add x1, x20, x15 # perform operation
# Check if x1 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x1, "test_134")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x00000002
add x23, x26, x27 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_135")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x80000000
add x29, x15, x8 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_136")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs1: x9 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x80000001
add x23, x9, x20 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_137")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0x7fffffff
add x8, x27, x29 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_138")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0x7ffffffe
add x7, x28, x12 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_139")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0xffffffff
add x16, x19, x29 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_140")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs1: x23 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0xfffffffe
add x9, x23, x11 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_141")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs1: x18 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x5bbc8872
add x15, x18, x22 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_142")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0xaaaaaaaa
add x18, x3, x21 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_143")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000001 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x00000001
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs2: x9 = 0x55555555
add x29, x28, x9 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_144")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs2: x28 = 0x00000000
add x15, x27, x28 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_145")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x00000001
add x13, x7, x20 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_146")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0x00000002
add x30, x27, x12 # perform operation
# Check if x30 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x30, "test_147")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs1: x12 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0x80000000
add x23, x12, x17 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_148")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs1: x20 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs2: x30 = 0x80000001
add x22, x20, x30 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_149")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x7fffffff
add x2, x24, x8 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_150")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x7ffffffe
add x11, x21, x27 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_151")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0xffffffff
add x3, x19, x17 # perform operation
# Check if x3 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x3, "test_152")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0xfffffffe
add x31, x14, x24 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_153")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs2: x14 = 0x5bbc8872
add x8, x19, x14 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_154")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0xaaaaaaaa
add x8, x14, x16 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_155")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x00000002 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0x00000002
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs2: x1 = 0x55555555
add x8, x11, x1 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_156")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs1: x30 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0x00000000
add x10, x30, x16 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_157")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs2: x30 = 0x00000001
add x10, x26, x30 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_158")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0x00000002
add x24, x28, x29 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_159")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs1: x12 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs2: x14 = 0x80000000
add x21, x12, x14 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_160")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x80000001
add x30, x26, x8 # perform operation
# Check if x30 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x30, "test_161")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs1: x29 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x7fffffff
add x11, x29, x24 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_162")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0x7ffffffe
add x28, x10, x17 # perform operation
# Check if x28 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x28, "test_163")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs2: x14 = 0xffffffff
add x16, x3, x14 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_164")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs2: x19 = 0xfffffffe
add x20, x27, x19 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x20, "test_165")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x5bbc8872
add x24, x16, x3 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_166")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs2: x7 = 0xaaaaaaaa
add x2, x11, x7 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_167")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000000 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x80000000
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0x55555555
add x7, x1, x16 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_168")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs2: x2 = 0x00000000
add x30, x15, x2 # perform operation
# Check if x30 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x30, "test_169")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs1: x13 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x00000001
add x19, x13, x24 # perform operation
# Check if x19 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x19, "test_170")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs1: x18 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x00000002
add x22, x18, x3 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_171")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0x80000000
add x7, x28, x21 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_172")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x80000001
add x15, x16, x27 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_173")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0x7fffffff
add x23, x16, x17 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_174")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs2: x7 = 0x7ffffffe
add x2, x27, x7 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_175")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0xffffffff
add x16, x2, x20 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_176")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs1: x9 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0xfffffffe
add x26, x9, x16 # perform operation
# Check if x26 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x26, "test_177")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0x5bbc8872
add x17, x15, x23 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_178")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs2: x10 = 0xaaaaaaaa
add x8, x28, x10 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_179")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x80000001 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs1: x18 = 0x80000001
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x55555555
add x16, x18, x22 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_180")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0x00000000
add x29, x27, x17 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_181")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs2: x28 = 0x00000001
add x20, x26, x28 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x20, "test_182")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs1: x23 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs2: x9 = 0x00000002
add x10, x23, x9 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_183")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs1: x30 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x80000000
add x22, x30, x20 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_184")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs1: x18 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs2: x7 = 0x80000001
add x3, x18, x7 # perform operation
# Check if x3 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x3, "test_185")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x31) # load rs1: x31 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x7fffffff
add x1, x31, x22 # perform operation
# Check if x1 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x1, "test_186")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0x7ffffffe
add x27, x21, x11 # perform operation
# Check if x27 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x27, "test_187")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0xffffffff
add x7, x1, x20 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_188")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0xfffffffe
add x9, x26, x20 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_189")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x5bbc8872
add x1, x26, x20 # perform operation
# Check if x1 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x1, "test_190")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0xaaaaaaaa
add x19, x14, x12 # perform operation
# Check if x19 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x19, "test_191")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7fffffff rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs1: x13 = 0x7fffffff
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs2: x18 = 0x55555555
add x7, x13, x18 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_192")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs2: x28 = 0x00000000
add x11, x16, x28 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_193")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x00000001
add x26, x14, x22 # perform operation
# Check if x26 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x26, "test_194")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs2: x2 = 0x00000002
add x31, x10, x2 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_195")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0x80000000
add x22, x7, x23 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_196")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs2: x19 = 0x80000001
add x13, x24, x19 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_197")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0x7fffffff
add x27, x15, x21 # perform operation
# Check if x27 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x27, "test_198")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs2: x2 = 0x7ffffffe
add x1, x10, x2 # perform operation
# Check if x1 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x1, "test_199")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs2: x13 = 0xffffffff
add x21, x24, x13 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_200")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs1: x13 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs2: x30 = 0xfffffffe
add x23, x13, x30 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_201")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0x5bbc8872
add x24, x28, x11 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_202")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs2: x10 = 0xaaaaaaaa
add x27, x11, x10 # perform operation
# Check if x27 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x27, "test_203")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x7ffffffe rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x7ffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x55555555
add x22, x28, x8 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_204")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x00000000
add x13, x15, x3 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_205")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x00000001
add x13, x11, x8 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_206")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs2: x18 = 0x00000002
add x2, x3, x18 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_207")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x30) # load rs1: x30 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x80000000
add x29, x30, x3 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_208")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x80000001
add x12, x26, x27 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_209")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x7fffffff
add x2, x11, x27 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_210")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs1: x17 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x7ffffffe
add x23, x17, x20 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_211")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0xffffffff
add x14, x15, x24 # perform operation
# Check if x14 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x14, "test_212")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0xfffffffe
add x12, x22, x21 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_213")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs1: x16 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs2: x19 = 0x5bbc8872
add x17, x16, x19 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_214")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs1: x22 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x31) # load rs2: x31 = 0xaaaaaaaa
add x30, x22, x31 # perform operation
# Check if x30 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x30, "test_215")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xffffffff rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0xffffffff
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs2: x2 = 0x55555555
add x13, x27, x2 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_216")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs1: x13 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs2: x28 = 0x00000000
add x19, x13, x28 # perform operation
# Check if x19 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x19, "test_217")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs2: x14 = 0x00000001
add x22, x10, x14 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_218")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs2: x18 = 0x00000002
add x15, x3, x18 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_219")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs2: x26 = 0x80000000
add x2, x14, x26 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_220")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs1: x8 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs2: x28 = 0x80000001
add x24, x8, x28 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_221")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x7fffffff
add x2, x24, x22 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_222")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs1: x18 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x7ffffffe
add x13, x18, x3 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_223")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs2: x7 = 0xffffffff
add x24, x21, x7 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_224")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0xfffffffe
add x20, x19, x12 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x20, "test_225")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x5bbc8872
add x11, x7, x3 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_226")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0xaaaaaaaa
add x12, x19, x3 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_227")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xfffffffe rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0xfffffffe
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x55555555
add x8, x19, x27 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_228")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs2: x26 = 0x00000000
add x11, x10, x26 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_229")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs2: x18 = 0x00000001
add x12, x3, x18 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_230")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs2: x11 = 0x00000002
add x19, x28, x11 # perform operation
# Check if x19 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x19, "test_231")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x80000000
add x31, x14, x3 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_232")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0x80000001
add x1, x21, x23 # perform operation
# Check if x1 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x1, "test_233")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0x7fffffff
add x22, x1, x21 # perform operation
# Check if x22 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x22, "test_234")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs1: x21 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0x7ffffffe
add x10, x21, x29 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_235")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x11) # load rs1: x11 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0xffffffff
add x9, x11, x22 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_236")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0xfffffffe
add x10, x15, x12 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_237")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0x5bbc8872
add x10, x7, x23 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_238")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x28) # load rs1: x28 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x18) # load rs2: x18 = 0xaaaaaaaa
add x13, x28, x18 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_239")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x5bbc8872 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x5bbc8872
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs2: x1 = 0x55555555
add x29, x26, x1 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_240")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs1: x14 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0x00000000
add x9, x14, x3 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_241")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs1: x10 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x22) # load rs2: x22 = 0x00000001
add x27, x10, x22 # perform operation
# Check if x27 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x27, "test_242")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x00000002
add x10, x1, x20 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_243")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs1: x12 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x80000000
add x23, x12, x27 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_244")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs1: x24 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs2: x13 = 0x80000001
add x18, x24, x13 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_245")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs1: x9 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs2: x23 = 0x7fffffff
add x18, x9, x23 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_246")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x7ffffffe
add x15, x26, x24 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_247")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs1: x23 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs2: x7 = 0xffffffff
add x12, x23, x7 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_248")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x13) # load rs1: x13 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs2: x17 = 0xfffffffe
add x3, x13, x17 # perform operation
# Check if x3 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x3, "test_249")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x23) # load rs1: x23 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x5bbc8872
add x31, x23, x20 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_250")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs1: x12 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs2: x7 = 0xaaaaaaaa
add x16, x12, x7 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_251")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0xaaaaaaaa rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0xaaaaaaaa
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x55555555
add x2, x15, x8 # perform operation
# Check if x2 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x2, "test_252")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x00000000)
RVTEST_TESTDATA_LOAD_INT(x6, x15) # load rs1: x15 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs2: x27 = 0x00000000
add x23, x15, x27 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_253")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x00000001)
RVTEST_TESTDATA_LOAD_INT(x6, x7) # load rs1: x7 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x14) # load rs2: x14 = 0x00000001
add x17, x7, x14 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_254")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x00000002)
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs1: x26 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x21) # load rs2: x21 = 0x00000002
add x18, x26, x21 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_255")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x80000000)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x12) # load rs2: x12 = 0x80000000
add x11, x1, x12 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_256")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x80000001)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x24) # load rs2: x24 = 0x80000001
add x17, x3, x24 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_257")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x7fffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs1: x19 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x20) # load rs2: x20 = 0x7fffffff
add x21, x19, x20 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_258")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x7ffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x19) # load rs2: x19 = 0x7ffffffe
add x26, x2, x19 # perform operation
# Check if x26 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x26, "test_259")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0xffffffff)
RVTEST_TESTDATA_LOAD_INT(x6, x17) # load rs1: x17 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x16) # load rs2: x16 = 0xffffffff
add x24, x17, x16 # perform operation
# Check if x24 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x24, "test_260")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0xfffffffe)
RVTEST_TESTDATA_LOAD_INT(x6, x27) # load rs1: x27 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x26) # load rs2: x26 = 0xfffffffe
add x12, x27, x26 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_261")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x5bbc8872)
RVTEST_TESTDATA_LOAD_INT(x6, x9) # load rs1: x9 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs2: x29 = 0x5bbc8872
add x10, x9, x29 # perform operation
# Check if x10 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x10, "test_262")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0xaaaaaaaa)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x10) # load rs2: x10 = 0xaaaaaaaa
add x16, x3, x10 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_263")

# Testcase cr_rs1_rs2_edges (Test source rs1 = 0x55555555 rs2 = 0x55555555)
RVTEST_TESTDATA_LOAD_INT(x6, x29) # load rs1: x29 = 0x55555555
RVTEST_TESTDATA_LOAD_INT(x6, x8) # load rs2: x8 = 0x55555555
add x13, x29, x8 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_264")


cmp_rs1_rs2_tests:

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x0)
RVTEST_TESTDATA_LOAD_INT(x6, x0) # load rs1: x0 = 0x3b0abf30
RVTEST_TESTDATA_LOAD_INT(x6, x0) # load rs2: x0 = 0x639c4a01
add x21, x0, x0 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_265")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x1)
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs1: x1 = 0x2b1adbb8
RVTEST_TESTDATA_LOAD_INT(x6, x1) # load rs2: x1 = 0x89da5142
add x3, x1, x1 # perform operation
# Check if x3 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x3, "test_266")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x2)
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs1: x2 = 0x9f134ce1
RVTEST_TESTDATA_LOAD_INT(x6, x2) # load rs2: x2 = 0xeab15f50
add x15, x2, x2 # perform operation
# Check if x15 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x15, "test_267")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x3)
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs1: x3 = 0xbeca5ac0
RVTEST_TESTDATA_LOAD_INT(x6, x3) # load rs2: x3 = 0xa5595774
add x14, x3, x3 # perform operation
# Check if x14 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x14, "test_268")

mv x7, x4 # switch link pointer register to avoid conflict with test

mv x8, x5 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x4)
RVTEST_TESTDATA_LOAD_INT(x6, x4) # load rs1: x4 = 0x6f8e6afd
RVTEST_TESTDATA_LOAD_INT(x6, x4) # load rs2: x4 = 0x727d80fc
add x18, x4, x4 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x18, "test_269")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x5)
RVTEST_TESTDATA_LOAD_INT(x6, x5) # load rs1: x5 = 0xa307a3a6
RVTEST_TESTDATA_LOAD_INT(x6, x5) # load rs2: x5 = 0xdffcd93f
add x17, x5, x5 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x17, "test_270")

mv x30, x6 # switch data pointer register to avoid conflict with test

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x6)
RVTEST_TESTDATA_LOAD_INT(x30, x6) # load rs1: x6 = 0x857fbb8c
RVTEST_TESTDATA_LOAD_INT(x30, x6) # load rs2: x6 = 0x6c26f19f
add x19, x6, x6 # perform operation
# Check if x19 contains the expected result. x25 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x25, x7, x8, x19, "test_271")

mv x4, x7 # switch link pointer register to avoid conflict with test

mv x5, x8 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x7)
RVTEST_TESTDATA_LOAD_INT(x30, x7) # load rs1: x7 = 0x49731977
RVTEST_TESTDATA_LOAD_INT(x30, x7) # load rs2: x7 = 0x563f2056
add x0, x7, x7 # perform operation
# Check if x0 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x0, "test_272")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x8)
RVTEST_TESTDATA_LOAD_INT(x30, x8) # load rs1: x8 = 0x3c52b5ec
RVTEST_TESTDATA_LOAD_INT(x30, x8) # load rs2: x8 = 0xa21abb0a
add x6, x8, x8 # perform operation
# Check if x6 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x6, "test_273")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x9)
RVTEST_TESTDATA_LOAD_INT(x30, x9) # load rs1: x9 = 0x8934aeb0
RVTEST_TESTDATA_LOAD_INT(x30, x9) # load rs2: x9 = 0x30ad6ba4
add x8, x9, x9 # perform operation
# Check if x8 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x8, "test_274")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x10)
RVTEST_TESTDATA_LOAD_INT(x30, x10) # load rs1: x10 = 0x02695c89
RVTEST_TESTDATA_LOAD_INT(x30, x10) # load rs2: x10 = 0x06d68808
add x12, x10, x10 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_275")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x11)
RVTEST_TESTDATA_LOAD_INT(x30, x11) # load rs1: x11 = 0x0ca7e115
RVTEST_TESTDATA_LOAD_INT(x30, x11) # load rs2: x11 = 0x1eb33c93
add x29, x11, x11 # perform operation
# Check if x29 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x29, "test_276")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x12)
RVTEST_TESTDATA_LOAD_INT(x30, x12) # load rs1: x12 = 0x6ccd9165
RVTEST_TESTDATA_LOAD_INT(x30, x12) # load rs2: x12 = 0xf7873c28
add x17, x12, x12 # perform operation
# Check if x17 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x17, "test_277")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x13)
RVTEST_TESTDATA_LOAD_INT(x30, x13) # load rs1: x13 = 0x3c55197b
RVTEST_TESTDATA_LOAD_INT(x30, x13) # load rs2: x13 = 0xf0c129c5
add x23, x13, x13 # perform operation
# Check if x23 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x23, "test_278")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x14)
RVTEST_TESTDATA_LOAD_INT(x30, x14) # load rs1: x14 = 0x25d1cda0
RVTEST_TESTDATA_LOAD_INT(x30, x14) # load rs2: x14 = 0xcafcf856
add x7, x14, x14 # perform operation
# Check if x7 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x7, "test_279")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x15)
RVTEST_TESTDATA_LOAD_INT(x30, x15) # load rs1: x15 = 0x4cf29f92
RVTEST_TESTDATA_LOAD_INT(x30, x15) # load rs2: x15 = 0xdbe3d009
add x20, x15, x15 # perform operation
# Check if x20 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x20, "test_280")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x16)
RVTEST_TESTDATA_LOAD_INT(x30, x16) # load rs1: x16 = 0x75dbe834
RVTEST_TESTDATA_LOAD_INT(x30, x16) # load rs2: x16 = 0x73d4b766
add x9, x16, x16 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_281")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x17)
RVTEST_TESTDATA_LOAD_INT(x30, x17) # load rs1: x17 = 0x541c0d73
RVTEST_TESTDATA_LOAD_INT(x30, x17) # load rs2: x17 = 0xe4982b4e
add x11, x17, x17 # perform operation
# Check if x11 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x11, "test_282")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x18)
RVTEST_TESTDATA_LOAD_INT(x30, x18) # load rs1: x18 = 0xe957797a
RVTEST_TESTDATA_LOAD_INT(x30, x18) # load rs2: x18 = 0xd488c840
add x21, x18, x18 # perform operation
# Check if x21 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x21, "test_283")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x19)
RVTEST_TESTDATA_LOAD_INT(x30, x19) # load rs1: x19 = 0xa6bb39ef
RVTEST_TESTDATA_LOAD_INT(x30, x19) # load rs2: x19 = 0x471d5c13
add x12, x19, x19 # perform operation
# Check if x12 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x12, "test_284")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x20)
RVTEST_TESTDATA_LOAD_INT(x30, x20) # load rs1: x20 = 0x63492b23
RVTEST_TESTDATA_LOAD_INT(x30, x20) # load rs2: x20 = 0x953395f3
add x13, x20, x20 # perform operation
# Check if x13 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x13, "test_285")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x21)
RVTEST_TESTDATA_LOAD_INT(x30, x21) # load rs1: x21 = 0xc6837ba5
RVTEST_TESTDATA_LOAD_INT(x30, x21) # load rs2: x21 = 0x987974da
add x16, x21, x21 # perform operation
# Check if x16 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x16, "test_286")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x22)
RVTEST_TESTDATA_LOAD_INT(x30, x22) # load rs1: x22 = 0xb6f26b28
RVTEST_TESTDATA_LOAD_INT(x30, x22) # load rs2: x22 = 0x81b08eca
add x9, x22, x22 # perform operation
# Check if x9 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x9, "test_287")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x23)
RVTEST_TESTDATA_LOAD_INT(x30, x23) # load rs1: x23 = 0x8566132f
RVTEST_TESTDATA_LOAD_INT(x30, x23) # load rs2: x23 = 0x0cc35e40
add x18, x23, x23 # perform operation
# Check if x18 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x18, "test_288")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x24)
RVTEST_TESTDATA_LOAD_INT(x30, x24) # load rs1: x24 = 0xb8c69043
RVTEST_TESTDATA_LOAD_INT(x30, x24) # load rs2: x24 = 0x4fd7fb75
add x31, x24, x24 # perform operation
# Check if x31 contains the expected result. x25 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x25, x4, x5, x31, "test_289")

mv x22, x25 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x25)
RVTEST_TESTDATA_LOAD_INT(x30, x25) # load rs1: x25 = 0x3cf2d8e2
RVTEST_TESTDATA_LOAD_INT(x30, x25) # load rs2: x25 = 0xc4045122
add x2, x25, x25 # perform operation
# Check if x2 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x2, "test_290")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x26)
RVTEST_TESTDATA_LOAD_INT(x30, x26) # load rs1: x26 = 0x5e40e8a5
RVTEST_TESTDATA_LOAD_INT(x30, x26) # load rs2: x26 = 0xd4954596
add x25, x26, x26 # perform operation
# Check if x25 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x25, "test_291")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x27)
RVTEST_TESTDATA_LOAD_INT(x30, x27) # load rs1: x27 = 0xcfa5b9a1
RVTEST_TESTDATA_LOAD_INT(x30, x27) # load rs2: x27 = 0x9643bcfa
add x15, x27, x27 # perform operation
# Check if x15 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x15, "test_292")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x28)
RVTEST_TESTDATA_LOAD_INT(x30, x28) # load rs1: x28 = 0xa9d4cf1a
RVTEST_TESTDATA_LOAD_INT(x30, x28) # load rs2: x28 = 0x07a15622
add x17, x28, x28 # perform operation
# Check if x17 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x17, "test_293")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x29)
RVTEST_TESTDATA_LOAD_INT(x30, x29) # load rs1: x29 = 0x64566dca
RVTEST_TESTDATA_LOAD_INT(x30, x29) # load rs2: x29 = 0xe7ca12e6
add x26, x29, x29 # perform operation
# Check if x26 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x26, "test_294")

mv x20, x30 # switch data pointer register to avoid conflict with test

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x30)
RVTEST_TESTDATA_LOAD_INT(x20, x30) # load rs1: x30 = 0x674a861b
RVTEST_TESTDATA_LOAD_INT(x20, x30) # load rs2: x30 = 0xdc788394
add x6, x30, x30 # perform operation
# Check if x6 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x6, "test_295")

# Testcase cmp_rs1_rs2 (Test rs1 = rs2 = x31)
RVTEST_TESTDATA_LOAD_INT(x20, x31) # load rs1: x31 = 0x70c3f3b2
RVTEST_TESTDATA_LOAD_INT(x20, x31) # load rs2: x31 = 0x293c5fbd
add x15, x31, x31 # perform operation
# Check if x15 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x15, "test_296")


cmp_rd_rs1_tests:

# Testcase cmp_rd_rs1 (Test rd = rs1 = x0)
RVTEST_TESTDATA_LOAD_INT(x20, x0) # load rs1: x0 = 0xdad8c80c
RVTEST_TESTDATA_LOAD_INT(x20, x31) # load rs2: x31 = 0xd8fde627
add x0, x0, x31 # perform operation
# Check if x0 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x0, "test_297")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x1)
RVTEST_TESTDATA_LOAD_INT(x20, x1) # load rs1: x1 = 0x13d230a8
RVTEST_TESTDATA_LOAD_INT(x20, x27) # load rs2: x27 = 0x2dc38077
add x1, x1, x27 # perform operation
# Check if x1 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x1, "test_298")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x2)
RVTEST_TESTDATA_LOAD_INT(x20, x2) # load rs1: x2 = 0x14d2b4ae
RVTEST_TESTDATA_LOAD_INT(x20, x19) # load rs2: x19 = 0x6475c77f
add x2, x2, x19 # perform operation
# Check if x2 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x2, "test_299")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x3)
RVTEST_TESTDATA_LOAD_INT(x20, x3) # load rs1: x3 = 0x210976e0
RVTEST_TESTDATA_LOAD_INT(x20, x15) # load rs2: x15 = 0x1d0ea0c7
add x3, x3, x15 # perform operation
# Check if x3 contains the expected result. x22 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x22, x4, x5, x3, "test_300")

mv x12, x4 # switch link pointer register to avoid conflict with test

mv x13, x5 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x4)
RVTEST_TESTDATA_LOAD_INT(x20, x4) # load rs1: x4 = 0x40f76593
RVTEST_TESTDATA_LOAD_INT(x20, x1) # load rs2: x1 = 0x66da39c0
add x4, x4, x1 # perform operation
# Check if x4 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x4, "test_301")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x5)
RVTEST_TESTDATA_LOAD_INT(x20, x5) # load rs1: x5 = 0x950d3da8
RVTEST_TESTDATA_LOAD_INT(x20, x24) # load rs2: x24 = 0xbbfc5568
add x5, x5, x24 # perform operation
# Check if x5 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x5, "test_302")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x6)
RVTEST_TESTDATA_LOAD_INT(x20, x6) # load rs1: x6 = 0x93e13662
RVTEST_TESTDATA_LOAD_INT(x20, x4) # load rs2: x4 = 0xd4856578
add x6, x6, x4 # perform operation
# Check if x6 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x6, "test_303")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x7)
RVTEST_TESTDATA_LOAD_INT(x20, x7) # load rs1: x7 = 0x4b83d603
RVTEST_TESTDATA_LOAD_INT(x20, x3) # load rs2: x3 = 0x49352329
add x7, x7, x3 # perform operation
# Check if x7 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x7, "test_304")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x8)
RVTEST_TESTDATA_LOAD_INT(x20, x8) # load rs1: x8 = 0x1575438d
RVTEST_TESTDATA_LOAD_INT(x20, x4) # load rs2: x4 = 0xd4473d9e
add x8, x8, x4 # perform operation
# Check if x8 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x8, "test_305")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x9)
RVTEST_TESTDATA_LOAD_INT(x20, x9) # load rs1: x9 = 0x1435e05b
RVTEST_TESTDATA_LOAD_INT(x20, x24) # load rs2: x24 = 0xb81b9c35
add x9, x9, x24 # perform operation
# Check if x9 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x9, "test_306")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x10)
RVTEST_TESTDATA_LOAD_INT(x20, x10) # load rs1: x10 = 0x284ca876
RVTEST_TESTDATA_LOAD_INT(x20, x6) # load rs2: x6 = 0xe2e1c233
add x10, x10, x6 # perform operation
# Check if x10 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x10, "test_307")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x11)
RVTEST_TESTDATA_LOAD_INT(x20, x11) # load rs1: x11 = 0xd4df032d
RVTEST_TESTDATA_LOAD_INT(x20, x19) # load rs2: x19 = 0x94ddf741
add x11, x11, x19 # perform operation
# Check if x11 contains the expected result. x22 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x22, x12, x13, x11, "test_308")

mv x7, x12 # switch link pointer register to avoid conflict with test

mv x8, x13 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x12)
RVTEST_TESTDATA_LOAD_INT(x20, x12) # load rs1: x12 = 0x8ca89615
RVTEST_TESTDATA_LOAD_INT(x20, x13) # load rs2: x13 = 0xc721d506
add x12, x12, x13 # perform operation
# Check if x12 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x12, "test_309")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x13)
RVTEST_TESTDATA_LOAD_INT(x20, x13) # load rs1: x13 = 0x40524d52
RVTEST_TESTDATA_LOAD_INT(x20, x28) # load rs2: x28 = 0xef53371d
add x13, x13, x28 # perform operation
# Check if x13 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x13, "test_310")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x14)
RVTEST_TESTDATA_LOAD_INT(x20, x14) # load rs1: x14 = 0xd4297cd1
RVTEST_TESTDATA_LOAD_INT(x20, x6) # load rs2: x6 = 0xd31c6727
add x14, x14, x6 # perform operation
# Check if x14 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x14, "test_311")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x15)
RVTEST_TESTDATA_LOAD_INT(x20, x15) # load rs1: x15 = 0xaad996a8
RVTEST_TESTDATA_LOAD_INT(x20, x24) # load rs2: x24 = 0x45603e7a
add x15, x15, x24 # perform operation
# Check if x15 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x15, "test_312")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x16)
RVTEST_TESTDATA_LOAD_INT(x20, x16) # load rs1: x16 = 0xb6da2abf
RVTEST_TESTDATA_LOAD_INT(x20, x19) # load rs2: x19 = 0x5b13009d
add x16, x16, x19 # perform operation
# Check if x16 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x16, "test_313")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x17)
RVTEST_TESTDATA_LOAD_INT(x20, x17) # load rs1: x17 = 0x65175ec0
RVTEST_TESTDATA_LOAD_INT(x20, x29) # load rs2: x29 = 0x3bbb2c2b
add x17, x17, x29 # perform operation
# Check if x17 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x17, "test_314")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x18)
RVTEST_TESTDATA_LOAD_INT(x20, x18) # load rs1: x18 = 0xd44a85e2
RVTEST_TESTDATA_LOAD_INT(x20, x10) # load rs2: x10 = 0x8a29a4e0
add x18, x18, x10 # perform operation
# Check if x18 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x18, "test_315")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x19)
RVTEST_TESTDATA_LOAD_INT(x20, x19) # load rs1: x19 = 0x99c8cf97
RVTEST_TESTDATA_LOAD_INT(x20, x27) # load rs2: x27 = 0xeb59aece
add x19, x19, x27 # perform operation
# Check if x19 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x19, "test_316")

mv x31, x20 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x20)
RVTEST_TESTDATA_LOAD_INT(x31, x20) # load rs1: x20 = 0x0310f2fa
RVTEST_TESTDATA_LOAD_INT(x31, x17) # load rs2: x17 = 0xb7d495d9
add x20, x20, x17 # perform operation
# Check if x20 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x20, "test_317")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x21)
RVTEST_TESTDATA_LOAD_INT(x31, x21) # load rs1: x21 = 0x4b515ae6
RVTEST_TESTDATA_LOAD_INT(x31, x13) # load rs2: x13 = 0x7863c7ab
add x21, x21, x13 # perform operation
# Check if x21 contains the expected result. x22 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x22, x7, x8, x21, "test_318")

mv x28, x22 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x22)
RVTEST_TESTDATA_LOAD_INT(x31, x22) # load rs1: x22 = 0xec28c191
RVTEST_TESTDATA_LOAD_INT(x31, x13) # load rs2: x13 = 0xe822b9d5
add x22, x22, x13 # perform operation
# Check if x22 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x22, "test_319")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x23)
RVTEST_TESTDATA_LOAD_INT(x31, x23) # load rs1: x23 = 0x8d4de868
RVTEST_TESTDATA_LOAD_INT(x31, x2) # load rs2: x2 = 0x037dd25f
add x23, x23, x2 # perform operation
# Check if x23 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x23, "test_320")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x24)
RVTEST_TESTDATA_LOAD_INT(x31, x24) # load rs1: x24 = 0x7370dd1a
RVTEST_TESTDATA_LOAD_INT(x31, x18) # load rs2: x18 = 0x8cf3785a
add x24, x24, x18 # perform operation
# Check if x24 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x24, "test_321")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x25)
RVTEST_TESTDATA_LOAD_INT(x31, x25) # load rs1: x25 = 0xa7b2c47a
RVTEST_TESTDATA_LOAD_INT(x31, x17) # load rs2: x17 = 0x873f70d3
add x25, x25, x17 # perform operation
# Check if x25 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x25, "test_322")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x26)
RVTEST_TESTDATA_LOAD_INT(x31, x26) # load rs1: x26 = 0xebfc02ff
RVTEST_TESTDATA_LOAD_INT(x31, x20) # load rs2: x20 = 0x77f1c376
add x26, x26, x20 # perform operation
# Check if x26 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x26, "test_323")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x27)
RVTEST_TESTDATA_LOAD_INT(x31, x27) # load rs1: x27 = 0x03b73419
RVTEST_TESTDATA_LOAD_INT(x31, x15) # load rs2: x15 = 0x7f6630a3
add x27, x27, x15 # perform operation
# Check if x27 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x27, "test_324")

mv x10, x28 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x28)
RVTEST_TESTDATA_LOAD_INT(x31, x28) # load rs1: x28 = 0xa812ee41
RVTEST_TESTDATA_LOAD_INT(x31, x2) # load rs2: x2 = 0xd9be163b
add x28, x28, x2 # perform operation
# Check if x28 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x28, "test_325")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x29)
RVTEST_TESTDATA_LOAD_INT(x31, x29) # load rs1: x29 = 0x8e9e4bba
RVTEST_TESTDATA_LOAD_INT(x31, x30) # load rs2: x30 = 0x34ccdb63
add x29, x29, x30 # perform operation
# Check if x29 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x29, "test_326")

# Testcase cmp_rd_rs1 (Test rd = rs1 = x30)
RVTEST_TESTDATA_LOAD_INT(x31, x30) # load rs1: x30 = 0xa6b63fea
RVTEST_TESTDATA_LOAD_INT(x31, x29) # load rs2: x29 = 0xf3844b43
add x30, x30, x29 # perform operation
# Check if x30 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x30, "test_327")

mv x9, x31 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs1 (Test rd = rs1 = x31)
RVTEST_TESTDATA_LOAD_INT(x9, x31) # load rs1: x31 = 0xdc29924b
RVTEST_TESTDATA_LOAD_INT(x9, x23) # load rs2: x23 = 0xfe96eca9
add x31, x31, x23 # perform operation
# Check if x31 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x31, "test_328")


cmp_rd_rs2_tests:

# Testcase cmp_rd_rs2 (Test rd = rs2 = x0)
RVTEST_TESTDATA_LOAD_INT(x9, x16) # load rs1: x16 = 0x11c38f06
RVTEST_TESTDATA_LOAD_INT(x9, x0) # load rs2: x0 = 0x6cadc7ef
add x0, x16, x0 # perform operation
# Check if x0 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x0, "test_329")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x1)
RVTEST_TESTDATA_LOAD_INT(x9, x26) # load rs1: x26 = 0xd5775b36
RVTEST_TESTDATA_LOAD_INT(x9, x1) # load rs2: x1 = 0x9616bc4e
add x1, x26, x1 # perform operation
# Check if x1 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x1, "test_330")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x2)
RVTEST_TESTDATA_LOAD_INT(x9, x21) # load rs1: x21 = 0x445dd5d6
RVTEST_TESTDATA_LOAD_INT(x9, x2) # load rs2: x2 = 0xe4375136
add x2, x21, x2 # perform operation
# Check if x2 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x2, "test_331")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x3)
RVTEST_TESTDATA_LOAD_INT(x9, x11) # load rs1: x11 = 0x74d90a87
RVTEST_TESTDATA_LOAD_INT(x9, x3) # load rs2: x3 = 0xc19c6366
add x3, x11, x3 # perform operation
# Check if x3 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x3, "test_332")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x4)
RVTEST_TESTDATA_LOAD_INT(x9, x0) # load rs1: x0 = 0xabb2c353
RVTEST_TESTDATA_LOAD_INT(x9, x4) # load rs2: x4 = 0x5a19c166
add x4, x0, x4 # perform operation
# Check if x4 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x4, "test_333")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x5)
RVTEST_TESTDATA_LOAD_INT(x9, x20) # load rs1: x20 = 0xf0b59163
RVTEST_TESTDATA_LOAD_INT(x9, x5) # load rs2: x5 = 0x1b379fa6
add x5, x20, x5 # perform operation
# Check if x5 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x5, "test_334")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x6)
RVTEST_TESTDATA_LOAD_INT(x9, x4) # load rs1: x4 = 0x08fd4b09
RVTEST_TESTDATA_LOAD_INT(x9, x6) # load rs2: x6 = 0x07a9dbc3
add x6, x4, x6 # perform operation
# Check if x6 contains the expected result. x10 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x10, x7, x8, x6, "test_335")

mv x12, x7 # switch link pointer register to avoid conflict with test

mv x13, x8 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x7)
RVTEST_TESTDATA_LOAD_INT(x9, x23) # load rs1: x23 = 0x41df21e3
RVTEST_TESTDATA_LOAD_INT(x9, x7) # load rs2: x7 = 0x7185dde1
add x7, x23, x7 # perform operation
# Check if x7 contains the expected result. x10 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x10, x12, x13, x7, "test_336")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x8)
RVTEST_TESTDATA_LOAD_INT(x9, x7) # load rs1: x7 = 0xc813c759
RVTEST_TESTDATA_LOAD_INT(x9, x8) # load rs2: x8 = 0x93559ff4
add x8, x7, x8 # perform operation
# Check if x8 contains the expected result. x10 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x10, x12, x13, x8, "test_337")

mv x28, x9 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x9)
RVTEST_TESTDATA_LOAD_INT(x28, x11) # load rs1: x11 = 0xdd91a4d6
RVTEST_TESTDATA_LOAD_INT(x28, x9) # load rs2: x9 = 0x73b79244
add x9, x11, x9 # perform operation
# Check if x9 contains the expected result. x10 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x10, x12, x13, x9, "test_338")

mv x17, x10 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x10)
RVTEST_TESTDATA_LOAD_INT(x28, x26) # load rs1: x26 = 0x0f653fb9
RVTEST_TESTDATA_LOAD_INT(x28, x10) # load rs2: x10 = 0x64305643
add x10, x26, x10 # perform operation
# Check if x10 contains the expected result. x17 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x17, x12, x13, x10, "test_339")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x11)
RVTEST_TESTDATA_LOAD_INT(x28, x23) # load rs1: x23 = 0xf2239287
RVTEST_TESTDATA_LOAD_INT(x28, x11) # load rs2: x11 = 0x853fd25e
add x11, x23, x11 # perform operation
# Check if x11 contains the expected result. x17 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x17, x12, x13, x11, "test_340")

mv x7, x12 # switch link pointer register to avoid conflict with test

mv x8, x13 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x12)
RVTEST_TESTDATA_LOAD_INT(x28, x18) # load rs1: x18 = 0xff4c216e
RVTEST_TESTDATA_LOAD_INT(x28, x12) # load rs2: x12 = 0x49c42e8a
add x12, x18, x12 # perform operation
# Check if x12 contains the expected result. x17 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x17, x7, x8, x12, "test_341")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x13)
RVTEST_TESTDATA_LOAD_INT(x28, x11) # load rs1: x11 = 0xb140a3b3
RVTEST_TESTDATA_LOAD_INT(x28, x13) # load rs2: x13 = 0x94d4cecd
add x13, x11, x13 # perform operation
# Check if x13 contains the expected result. x17 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x17, x7, x8, x13, "test_342")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x14)
RVTEST_TESTDATA_LOAD_INT(x28, x21) # load rs1: x21 = 0xe9d5edb8
RVTEST_TESTDATA_LOAD_INT(x28, x14) # load rs2: x14 = 0xa22c5472
add x14, x21, x14 # perform operation
# Check if x14 contains the expected result. x17 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x17, x7, x8, x14, "test_343")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x15)
RVTEST_TESTDATA_LOAD_INT(x28, x18) # load rs1: x18 = 0x7dae30f7
RVTEST_TESTDATA_LOAD_INT(x28, x15) # load rs2: x15 = 0xed7fac23
add x15, x18, x15 # perform operation
# Check if x15 contains the expected result. x17 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x17, x7, x8, x15, "test_344")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x16)
RVTEST_TESTDATA_LOAD_INT(x28, x11) # load rs1: x11 = 0x2cb3eb5a
RVTEST_TESTDATA_LOAD_INT(x28, x16) # load rs2: x16 = 0xd6e5f23c
add x16, x11, x16 # perform operation
# Check if x16 contains the expected result. x17 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x17, x7, x8, x16, "test_345")

mv x3, x17 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x17)
RVTEST_TESTDATA_LOAD_INT(x28, x1) # load rs1: x1 = 0x3dad2fc7
RVTEST_TESTDATA_LOAD_INT(x28, x17) # load rs2: x17 = 0xe0d24e92
add x17, x1, x17 # perform operation
# Check if x17 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x17, "test_346")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x18)
RVTEST_TESTDATA_LOAD_INT(x28, x27) # load rs1: x27 = 0x3204c113
RVTEST_TESTDATA_LOAD_INT(x28, x18) # load rs2: x18 = 0x424c15fb
add x18, x27, x18 # perform operation
# Check if x18 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x18, "test_347")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x19)
RVTEST_TESTDATA_LOAD_INT(x28, x31) # load rs1: x31 = 0x8a064d5f
RVTEST_TESTDATA_LOAD_INT(x28, x19) # load rs2: x19 = 0x62afbf47
add x19, x31, x19 # perform operation
# Check if x19 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x19, "test_348")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x20)
RVTEST_TESTDATA_LOAD_INT(x28, x14) # load rs1: x14 = 0xef35d077
RVTEST_TESTDATA_LOAD_INT(x28, x20) # load rs2: x20 = 0x08b49946
add x20, x14, x20 # perform operation
# Check if x20 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x20, "test_349")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x21)
RVTEST_TESTDATA_LOAD_INT(x28, x15) # load rs1: x15 = 0x801a2522
RVTEST_TESTDATA_LOAD_INT(x28, x21) # load rs2: x21 = 0x67058c65
add x21, x15, x21 # perform operation
# Check if x21 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x21, "test_350")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x22)
RVTEST_TESTDATA_LOAD_INT(x28, x10) # load rs1: x10 = 0x2d2974ca
RVTEST_TESTDATA_LOAD_INT(x28, x22) # load rs2: x22 = 0x92188931
add x22, x10, x22 # perform operation
# Check if x22 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x22, "test_351")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x23)
RVTEST_TESTDATA_LOAD_INT(x28, x26) # load rs1: x26 = 0x56267b65
RVTEST_TESTDATA_LOAD_INT(x28, x23) # load rs2: x23 = 0x26fd4608
add x23, x26, x23 # perform operation
# Check if x23 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x23, "test_352")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x24)
RVTEST_TESTDATA_LOAD_INT(x28, x2) # load rs1: x2 = 0xa5aac909
RVTEST_TESTDATA_LOAD_INT(x28, x24) # load rs2: x24 = 0x6181f190
add x24, x2, x24 # perform operation
# Check if x24 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x24, "test_353")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x25)
RVTEST_TESTDATA_LOAD_INT(x28, x19) # load rs1: x19 = 0xc5b09f99
RVTEST_TESTDATA_LOAD_INT(x28, x25) # load rs2: x25 = 0x356880c0
add x25, x19, x25 # perform operation
# Check if x25 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x25, "test_354")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x26)
RVTEST_TESTDATA_LOAD_INT(x28, x0) # load rs1: x0 = 0xa346625a
RVTEST_TESTDATA_LOAD_INT(x28, x26) # load rs2: x26 = 0xc1d870de
add x26, x0, x26 # perform operation
# Check if x26 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x26, "test_355")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x27)
RVTEST_TESTDATA_LOAD_INT(x28, x9) # load rs1: x9 = 0x33618588
RVTEST_TESTDATA_LOAD_INT(x28, x27) # load rs2: x27 = 0x3c552c59
add x27, x9, x27 # perform operation
# Check if x27 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x27, "test_356")

mv x30, x28 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x28)
RVTEST_TESTDATA_LOAD_INT(x30, x14) # load rs1: x14 = 0x33450207
RVTEST_TESTDATA_LOAD_INT(x30, x28) # load rs2: x28 = 0x02815859
add x28, x14, x28 # perform operation
# Check if x28 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x28, "test_357")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x29)
RVTEST_TESTDATA_LOAD_INT(x30, x2) # load rs1: x2 = 0x33b1805a
RVTEST_TESTDATA_LOAD_INT(x30, x29) # load rs2: x29 = 0xda3ec045
add x29, x2, x29 # perform operation
# Check if x29 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x29, "test_358")

mv x23, x30 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs2 (Test rd = rs2 = x30)
RVTEST_TESTDATA_LOAD_INT(x23, x27) # load rs1: x27 = 0x98018d68
RVTEST_TESTDATA_LOAD_INT(x23, x30) # load rs2: x30 = 0x862215f9
add x30, x27, x30 # perform operation
# Check if x30 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x30, "test_359")

# Testcase cmp_rd_rs2 (Test rd = rs2 = x31)
RVTEST_TESTDATA_LOAD_INT(x23, x6) # load rs1: x6 = 0x75b2f4df
RVTEST_TESTDATA_LOAD_INT(x23, x31) # load rs2: x31 = 0xda4cc5e3
add x31, x6, x31 # perform operation
# Check if x31 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x31, "test_360")


cmp_rd_rs1_rs2_tests:

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x0)
RVTEST_TESTDATA_LOAD_INT(x23, x0) # load rs1: x0 = 0x3aab7231
RVTEST_TESTDATA_LOAD_INT(x23, x0) # load rs2: x0 = 0x4a584c85
add x0, x0, x0 # perform operation
# Check if x0 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x0, "test_361")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x1)
RVTEST_TESTDATA_LOAD_INT(x23, x1) # load rs1: x1 = 0xf991fce4
RVTEST_TESTDATA_LOAD_INT(x23, x1) # load rs2: x1 = 0x309f2cbe
add x1, x1, x1 # perform operation
# Check if x1 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x1, "test_362")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x2)
RVTEST_TESTDATA_LOAD_INT(x23, x2) # load rs1: x2 = 0x2fa9008d
RVTEST_TESTDATA_LOAD_INT(x23, x2) # load rs2: x2 = 0xa9101faf
add x2, x2, x2 # perform operation
# Check if x2 contains the expected result. x3 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x3, x7, x8, x2, "test_363")

mv x28, x3 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x3)
RVTEST_TESTDATA_LOAD_INT(x23, x3) # load rs1: x3 = 0xd750ccf6
RVTEST_TESTDATA_LOAD_INT(x23, x3) # load rs2: x3 = 0xe09868da
add x3, x3, x3 # perform operation
# Check if x3 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x3, "test_364")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x4)
RVTEST_TESTDATA_LOAD_INT(x23, x4) # load rs1: x4 = 0x1f930592
RVTEST_TESTDATA_LOAD_INT(x23, x4) # load rs2: x4 = 0xc9651700
add x4, x4, x4 # perform operation
# Check if x4 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x4, "test_365")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x5)
RVTEST_TESTDATA_LOAD_INT(x23, x5) # load rs1: x5 = 0x5cf04e6e
RVTEST_TESTDATA_LOAD_INT(x23, x5) # load rs2: x5 = 0x80e0bc7a
add x5, x5, x5 # perform operation
# Check if x5 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x5, "test_366")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x6)
RVTEST_TESTDATA_LOAD_INT(x23, x6) # load rs1: x6 = 0xaf5c8f2c
RVTEST_TESTDATA_LOAD_INT(x23, x6) # load rs2: x6 = 0x6902a31d
add x6, x6, x6 # perform operation
# Check if x6 contains the expected result. x28 is the signature ptr, x7 is the link ptr, x8 is a temp reg.
RVTEST_SIGUPD(x28, x7, x8, x6, "test_367")

mv x12, x7 # switch link pointer register to avoid conflict with test

mv x13, x8 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x7)
RVTEST_TESTDATA_LOAD_INT(x23, x7) # load rs1: x7 = 0xd78d5eb5
RVTEST_TESTDATA_LOAD_INT(x23, x7) # load rs2: x7 = 0xe8b32256
add x7, x7, x7 # perform operation
# Check if x7 contains the expected result. x28 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x28, x12, x13, x7, "test_368")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x8)
RVTEST_TESTDATA_LOAD_INT(x23, x8) # load rs1: x8 = 0xf021ba8d
RVTEST_TESTDATA_LOAD_INT(x23, x8) # load rs2: x8 = 0x52442967
add x8, x8, x8 # perform operation
# Check if x8 contains the expected result. x28 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x28, x12, x13, x8, "test_369")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x9)
RVTEST_TESTDATA_LOAD_INT(x23, x9) # load rs1: x9 = 0xde8a6c21
RVTEST_TESTDATA_LOAD_INT(x23, x9) # load rs2: x9 = 0x9a6a75e9
add x9, x9, x9 # perform operation
# Check if x9 contains the expected result. x28 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x28, x12, x13, x9, "test_370")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x10)
RVTEST_TESTDATA_LOAD_INT(x23, x10) # load rs1: x10 = 0x149b8dc3
RVTEST_TESTDATA_LOAD_INT(x23, x10) # load rs2: x10 = 0x70b8ae2b
add x10, x10, x10 # perform operation
# Check if x10 contains the expected result. x28 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x28, x12, x13, x10, "test_371")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x11)
RVTEST_TESTDATA_LOAD_INT(x23, x11) # load rs1: x11 = 0x1ff796c9
RVTEST_TESTDATA_LOAD_INT(x23, x11) # load rs2: x11 = 0xcd2d175d
add x11, x11, x11 # perform operation
# Check if x11 contains the expected result. x28 is the signature ptr, x12 is the link ptr, x13 is a temp reg.
RVTEST_SIGUPD(x28, x12, x13, x11, "test_372")

mv x4, x12 # switch link pointer register to avoid conflict with test

mv x5, x13 # switch temp pointer register to avoid conflict with test

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x12)
RVTEST_TESTDATA_LOAD_INT(x23, x12) # load rs1: x12 = 0xb0b178ee
RVTEST_TESTDATA_LOAD_INT(x23, x12) # load rs2: x12 = 0xb673eaa6
add x12, x12, x12 # perform operation
# Check if x12 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x12, "test_373")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x13)
RVTEST_TESTDATA_LOAD_INT(x23, x13) # load rs1: x13 = 0xd816993e
RVTEST_TESTDATA_LOAD_INT(x23, x13) # load rs2: x13 = 0x5dc351c2
add x13, x13, x13 # perform operation
# Check if x13 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x13, "test_374")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x14)
RVTEST_TESTDATA_LOAD_INT(x23, x14) # load rs1: x14 = 0x6f3e3200
RVTEST_TESTDATA_LOAD_INT(x23, x14) # load rs2: x14 = 0xc3f9a1b2
add x14, x14, x14 # perform operation
# Check if x14 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x14, "test_375")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x15)
RVTEST_TESTDATA_LOAD_INT(x23, x15) # load rs1: x15 = 0xb990488b
RVTEST_TESTDATA_LOAD_INT(x23, x15) # load rs2: x15 = 0x02ad0ee5
add x15, x15, x15 # perform operation
# Check if x15 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x15, "test_376")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x16)
RVTEST_TESTDATA_LOAD_INT(x23, x16) # load rs1: x16 = 0xb6dea232
RVTEST_TESTDATA_LOAD_INT(x23, x16) # load rs2: x16 = 0x612bb546
add x16, x16, x16 # perform operation
# Check if x16 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x16, "test_377")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x17)
RVTEST_TESTDATA_LOAD_INT(x23, x17) # load rs1: x17 = 0x5439a97f
RVTEST_TESTDATA_LOAD_INT(x23, x17) # load rs2: x17 = 0xebbefb3f
add x17, x17, x17 # perform operation
# Check if x17 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x17, "test_378")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x18)
RVTEST_TESTDATA_LOAD_INT(x23, x18) # load rs1: x18 = 0x6db29014
RVTEST_TESTDATA_LOAD_INT(x23, x18) # load rs2: x18 = 0xc8942b04
add x18, x18, x18 # perform operation
# Check if x18 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x18, "test_379")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x19)
RVTEST_TESTDATA_LOAD_INT(x23, x19) # load rs1: x19 = 0x920b6e3a
RVTEST_TESTDATA_LOAD_INT(x23, x19) # load rs2: x19 = 0xe5a24262
add x19, x19, x19 # perform operation
# Check if x19 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x19, "test_380")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x20)
RVTEST_TESTDATA_LOAD_INT(x23, x20) # load rs1: x20 = 0x517c4547
RVTEST_TESTDATA_LOAD_INT(x23, x20) # load rs2: x20 = 0xad43d325
add x20, x20, x20 # perform operation
# Check if x20 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x20, "test_381")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x21)
RVTEST_TESTDATA_LOAD_INT(x23, x21) # load rs1: x21 = 0x88bd603e
RVTEST_TESTDATA_LOAD_INT(x23, x21) # load rs2: x21 = 0x286f9743
add x21, x21, x21 # perform operation
# Check if x21 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x21, "test_382")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x22)
RVTEST_TESTDATA_LOAD_INT(x23, x22) # load rs1: x22 = 0x49780ca6
RVTEST_TESTDATA_LOAD_INT(x23, x22) # load rs2: x22 = 0x29bf4069
add x22, x22, x22 # perform operation
# Check if x22 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x22, "test_383")

mv x17, x23 # switch data pointer register to avoid conflict with test

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x23)
RVTEST_TESTDATA_LOAD_INT(x17, x23) # load rs1: x23 = 0xbdc0a76c
RVTEST_TESTDATA_LOAD_INT(x17, x23) # load rs2: x23 = 0x3c9cfdf3
add x23, x23, x23 # perform operation
# Check if x23 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x23, "test_384")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x24)
RVTEST_TESTDATA_LOAD_INT(x17, x24) # load rs1: x24 = 0xc719c7a5
RVTEST_TESTDATA_LOAD_INT(x17, x24) # load rs2: x24 = 0x66154043
add x24, x24, x24 # perform operation
# Check if x24 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x24, "test_385")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x25)
RVTEST_TESTDATA_LOAD_INT(x17, x25) # load rs1: x25 = 0xc9761a48
RVTEST_TESTDATA_LOAD_INT(x17, x25) # load rs2: x25 = 0x454ed176
add x25, x25, x25 # perform operation
# Check if x25 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x25, "test_386")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x26)
RVTEST_TESTDATA_LOAD_INT(x17, x26) # load rs1: x26 = 0x4e54e998
RVTEST_TESTDATA_LOAD_INT(x17, x26) # load rs2: x26 = 0xff10bb19
add x26, x26, x26 # perform operation
# Check if x26 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x26, "test_387")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x27)
RVTEST_TESTDATA_LOAD_INT(x17, x27) # load rs1: x27 = 0x04b9e694
RVTEST_TESTDATA_LOAD_INT(x17, x27) # load rs2: x27 = 0xd9ddecd9
add x27, x27, x27 # perform operation
# Check if x27 contains the expected result. x28 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x28, x4, x5, x27, "test_388")

mv x19, x28 # switch signature pointer register to avoid conflict with test

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x28)
RVTEST_TESTDATA_LOAD_INT(x17, x28) # load rs1: x28 = 0xd850e8ad
RVTEST_TESTDATA_LOAD_INT(x17, x28) # load rs2: x28 = 0xfe88380b
add x28, x28, x28 # perform operation
# Check if x28 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x28, "test_389")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x29)
RVTEST_TESTDATA_LOAD_INT(x17, x29) # load rs1: x29 = 0x27b7876b
RVTEST_TESTDATA_LOAD_INT(x17, x29) # load rs2: x29 = 0x2d755a95
add x29, x29, x29 # perform operation
# Check if x29 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x29, "test_390")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x30)
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs1: x30 = 0xdf1dd270
RVTEST_TESTDATA_LOAD_INT(x17, x30) # load rs2: x30 = 0x67be7bcd
add x30, x30, x30 # perform operation
# Check if x30 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x30, "test_391")

# Testcase cmp_rd_rs1_rs2 (Test rd = rs1 = rs2 = x31)
RVTEST_TESTDATA_LOAD_INT(x17, x31) # load rs1: x31 = 0x3a44d1d3
RVTEST_TESTDATA_LOAD_INT(x17, x31) # load rs2: x31 = 0x0458d60e
add x31, x31, x31 # perform operation
# Check if x31 contains the expected result. x19 is the signature ptr, x4 is the link ptr, x5 is a temp reg.
RVTEST_SIGUPD(x19, x4, x5, x31, "test_392")


// Instantiate trap handlers and other epilog code, call RVMODEL_HALT at end of test
RVTEST_CODE_END

// Create scratch data sections and label for test data
RVTEST_DATA_BEGIN

    // Test data
    .word 0xed199c2a
    .word 0x3d120729
    .word 0xf95ba545
    .word 0x1f8b4c83
    .word 0x117cfa69
    .word 0x6b5ec0b1
    .word 0xeec5c7fc
    .word 0xd8483d27
    .word 0xe637281b
    .word 0xf420cbf4
    .word 0x26a21865
    .word 0x5d018fe6
    .word 0x876240f5
    .word 0xba52de6d
    .word 0x2d5aee8b
    .word 0x1856a7fa
    .word 0xd420d633
    .word 0xb57e79ab
    .word 0xb45312c3
    .word 0x802e5cbe
    .word 0x0f865f5c
    .word 0xa3a2996d
    .word 0xd06cfac9
    .word 0x7b11a602
    .word 0x70a493f3
    .word 0xc758b40b
    .word 0x40214e38
    .word 0x981d9fac
    .word 0xde7d9301
    .word 0xfa1129a5
    .word 0x4afda77e
    .word 0x5cc11b57
    .word 0xbfb50e27
    .word 0xa2773413
    .word 0x1483c110
    .word 0x41796538
    .word 0xb0171db4
    .word 0x15685edf
    .word 0x372635c8
    .word 0xabe63122
    .word 0x17e1045d
    .word 0x36ec53d3
    .word 0xfbba752e
    .word 0xf0c74336
    .word 0xdb6f1137
    .word 0xc29ebecd
    .word 0x78e8edfc
    .word 0x5ccbb261
    .word 0xfed08e43
    .word 0x27bb3ee5
    .word 0x2abf7cf7
    .word 0x93f42a31
    .word 0xc3afbdd2
    .word 0xc71a0e78
    .word 0xffc9caef
    .word 0xabc8b3e9
    .word 0x540d414f
    .word 0x27de3f8b
    .word 0x3af03ed8
    .word 0x82867701
    .word 0x7d2eb89b
    .word 0x117b6f0f
    .word 0xa9fe1b24
    .word 0xfdfb2019
    .word 0x3eaae683
    .word 0x067ee1d1
    .word 0x7f3dab23
    .word 0x0281b902
    .word 0x4ea14c52
    .word 0x2bde2cae
    .word 0x94337b3a
    .word 0x2fab724e
    .word 0xb44bf23a
    .word 0xa4e1b102
    .word 0x3b9b6e94
    .word 0xc836c192
    .word 0x3b5d0235
    .word 0xd926fe45
    .word 0x0818ebd1
    .word 0x4e48467d
    .word 0x3bf88405
    .word 0xb4a1a140
    .word 0xde44271a
    .word 0x8940d7c5
    .word 0xe32c4825
    .word 0x7cc721c3
    .word 0x5f0316e5
    .word 0x928e3c15
    .word 0x74d30640
    .word 0x4fc8a7d6
    .word 0xc7ad9342
    .word 0xf7671b93
    .word 0x26dd3cfe
    .word 0x6b996319
    .word 0xfb73cb6c
    .word 0x4141f5f9
    .word 0x05cc7e6b
    .word 0xb757937f
    .word 0xb15b6fef
    .word 0xc7966030
    .word 0xa4571a9b
    .word 0x3f00be87
    .word 0xbce3e7fb
    .word 0xeeda0414
    .word 0x7006b21d
    .word 0x9f384bd6
    .word 0xb17b9ef4
    .word 0xad0e914a
    .word 0xd639a8ad
    .word 0xf83a4f86
    .word 0x4a9cd9de
    .word 0x714599fc
    .word 0xf21bdfcf
    .word 0xa93f47cc
    .word 0x5fcf6182
    .word 0x07d2aa1e
    .word 0xda7f969f
    .word 0xbcef98f6
    .word 0xccb5eb7b
    .word 0xe2485bb0
    .word 0x971ed8e8
    .word 0xbf9abc66
    .word 0x0217fb16
    .word 0x46b6bde5
    .word 0x14f03448
    .word 0x62a240ed
    .word 0x0aac8f33
    .word 0xd5fe5f7c
    .word 0xc1d58273
    .word 0xe7ceb07b
    .word 0x9bfbf146
    .word 0xf9444983
    .word 0x13190cdb
    .word 0x1796c960
    .word 0x9f8773de
    .word 0x186da37b
    .word 0xf1da32b9
    .word 0x3f9d2b53
    .word 0xfcc9c425
    .word 0xb8a9e200
    .word 0x7f142f3d
    .word 0x0c2a6a82
    .word 0xb30ad053
    .word 0xa622a84c
    .word 0xc4d6907c
    .word 0x8fde06b7
    .word 0x3188fc69
    .word 0xad50d179
    .word 0x620b6023
    .word 0x698be42b
    .word 0xf21e100d
    .word 0xf30d76e6
    .word 0x71a7383d
    .word 0x86e9a98e
    .word 0x18fdab72
    .word 0xea2ffa7b
    .word 0x04507ba2
    .word 0xe1e6daa3
    .word 0xb35c3576
    .word 0xb937f0d5
    .word 0x9d1babbf
    .word 0x9519d114
    .word 0xabed9793
    .word 0x30c5d011
    .word 0xbf25b0d1
    .word 0xf8b159f8
    .word 0x906c4f43
    .word 0x56fa2832
    .word 0xd70241be
    .word 0x49bf4fdf
    .word 0xa3153a0c
    .word 0xefcb5221
    .word 0xf2af9519
    .word 0xfea8bcb4
    .word 0xf4430e4b
    .word 0x886a1096
    .word 0x2bd547b5
    .word 0xf61853a8
    .word 0xdb6e0539
    .word 0x90cf6c7c
    .word 0xd14f98d9
    .word 0xa9de691f
    .word 0xcd82a97a
    .word 0xdb55bce6
    .word 0xb83d042f
    .word 0x8b7b7bd7
    .word 0x21ccba0d
    .word 0xa01edcfa
    .word 0x3350bfef
    .word 0xaed9ac00
    .word 0x789baf59
    .word 0xb9fa9f15
    .word 0x00000000
    .word 0xc03744aa
    .word 0x00000001
    .word 0xe2f82790
    .word 0x00000002
    .word 0x73426dce
    .word 0x80000000
    .word 0xa3b9ae23
    .word 0x80000001
    .word 0xd7f4336f
    .word 0x7fffffff
    .word 0x14718a3d
    .word 0x7ffffffe
    .word 0x0fb1f161
    .word 0xffffffff
    .word 0x0c446dc3
    .word 0xfffffffe
    .word 0xfa02b496
    .word 0x5bbc8872
    .word 0xee925035
    .word 0xaaaaaaaa
    .word 0x81ad3590
    .word 0x55555555
    .word 0x125b9407
    .word 0xf98291ee
    .word 0x00000000
    .word 0x92be3f2b
    .word 0x00000001
    .word 0x30a1dae4
    .word 0x00000002
    .word 0x730a6ae4
    .word 0x80000000
    .word 0x1e214dd4
    .word 0x80000001
    .word 0xb4de2b95
    .word 0x7fffffff
    .word 0x6b0265a5
    .word 0x7ffffffe
    .word 0x50ece1cc
    .word 0xffffffff
    .word 0x4bb5f25c
    .word 0xfffffffe
    .word 0xd857328e
    .word 0x5bbc8872
    .word 0x0556e722
    .word 0xaaaaaaaa
    .word 0x00927107
    .word 0x55555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000001
    .word 0x00000000
    .word 0x00000002
    .word 0x00000000
    .word 0x80000000
    .word 0x00000000
    .word 0x80000001
    .word 0x00000000
    .word 0x7fffffff
    .word 0x00000000
    .word 0x7ffffffe
    .word 0x00000000
    .word 0xffffffff
    .word 0x00000000
    .word 0xfffffffe
    .word 0x00000000
    .word 0x5bbc8872
    .word 0x00000000
    .word 0xaaaaaaaa
    .word 0x00000000
    .word 0x55555555
    .word 0x00000001
    .word 0x00000000
    .word 0x00000001
    .word 0x00000001
    .word 0x00000001
    .word 0x00000002
    .word 0x00000001
    .word 0x80000000
    .word 0x00000001
    .word 0x80000001
    .word 0x00000001
    .word 0x7fffffff
    .word 0x00000001
    .word 0x7ffffffe
    .word 0x00000001
    .word 0xffffffff
    .word 0x00000001
    .word 0xfffffffe
    .word 0x00000001
    .word 0x5bbc8872
    .word 0x00000001
    .word 0xaaaaaaaa
    .word 0x00000001
    .word 0x55555555
    .word 0x00000002
    .word 0x00000000
    .word 0x00000002
    .word 0x00000001
    .word 0x00000002
    .word 0x00000002
    .word 0x00000002
    .word 0x80000000
    .word 0x00000002
    .word 0x80000001
    .word 0x00000002
    .word 0x7fffffff
    .word 0x00000002
    .word 0x7ffffffe
    .word 0x00000002
    .word 0xffffffff
    .word 0x00000002
    .word 0xfffffffe
    .word 0x00000002
    .word 0x5bbc8872
    .word 0x00000002
    .word 0xaaaaaaaa
    .word 0x00000002
    .word 0x55555555
    .word 0x80000000
    .word 0x00000000
    .word 0x80000000
    .word 0x00000001
    .word 0x80000000
    .word 0x00000002
    .word 0x80000000
    .word 0x80000000
    .word 0x80000000
    .word 0x80000001
    .word 0x80000000
    .word 0x7fffffff
    .word 0x80000000
    .word 0x7ffffffe
    .word 0x80000000
    .word 0xffffffff
    .word 0x80000000
    .word 0xfffffffe
    .word 0x80000000
    .word 0x5bbc8872
    .word 0x80000000
    .word 0xaaaaaaaa
    .word 0x80000000
    .word 0x55555555
    .word 0x80000001
    .word 0x00000000
    .word 0x80000001
    .word 0x00000001
    .word 0x80000001
    .word 0x00000002
    .word 0x80000001
    .word 0x80000000
    .word 0x80000001
    .word 0x80000001
    .word 0x80000001
    .word 0x7fffffff
    .word 0x80000001
    .word 0x7ffffffe
    .word 0x80000001
    .word 0xffffffff
    .word 0x80000001
    .word 0xfffffffe
    .word 0x80000001
    .word 0x5bbc8872
    .word 0x80000001
    .word 0xaaaaaaaa
    .word 0x80000001
    .word 0x55555555
    .word 0x7fffffff
    .word 0x00000000
    .word 0x7fffffff
    .word 0x00000001
    .word 0x7fffffff
    .word 0x00000002
    .word 0x7fffffff
    .word 0x80000000
    .word 0x7fffffff
    .word 0x80000001
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7fffffff
    .word 0x7ffffffe
    .word 0x7fffffff
    .word 0xffffffff
    .word 0x7fffffff
    .word 0xfffffffe
    .word 0x7fffffff
    .word 0x5bbc8872
    .word 0x7fffffff
    .word 0xaaaaaaaa
    .word 0x7fffffff
    .word 0x55555555
    .word 0x7ffffffe
    .word 0x00000000
    .word 0x7ffffffe
    .word 0x00000001
    .word 0x7ffffffe
    .word 0x00000002
    .word 0x7ffffffe
    .word 0x80000000
    .word 0x7ffffffe
    .word 0x80000001
    .word 0x7ffffffe
    .word 0x7fffffff
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0x7ffffffe
    .word 0xffffffff
    .word 0x7ffffffe
    .word 0xfffffffe
    .word 0x7ffffffe
    .word 0x5bbc8872
    .word 0x7ffffffe
    .word 0xaaaaaaaa
    .word 0x7ffffffe
    .word 0x55555555
    .word 0xffffffff
    .word 0x00000000
    .word 0xffffffff
    .word 0x00000001
    .word 0xffffffff
    .word 0x00000002
    .word 0xffffffff
    .word 0x80000000
    .word 0xffffffff
    .word 0x80000001
    .word 0xffffffff
    .word 0x7fffffff
    .word 0xffffffff
    .word 0x7ffffffe
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xfffffffe
    .word 0xffffffff
    .word 0x5bbc8872
    .word 0xffffffff
    .word 0xaaaaaaaa
    .word 0xffffffff
    .word 0x55555555
    .word 0xfffffffe
    .word 0x00000000
    .word 0xfffffffe
    .word 0x00000001
    .word 0xfffffffe
    .word 0x00000002
    .word 0xfffffffe
    .word 0x80000000
    .word 0xfffffffe
    .word 0x80000001
    .word 0xfffffffe
    .word 0x7fffffff
    .word 0xfffffffe
    .word 0x7ffffffe
    .word 0xfffffffe
    .word 0xffffffff
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0xfffffffe
    .word 0x5bbc8872
    .word 0xfffffffe
    .word 0xaaaaaaaa
    .word 0xfffffffe
    .word 0x55555555
    .word 0x5bbc8872
    .word 0x00000000
    .word 0x5bbc8872
    .word 0x00000001
    .word 0x5bbc8872
    .word 0x00000002
    .word 0x5bbc8872
    .word 0x80000000
    .word 0x5bbc8872
    .word 0x80000001
    .word 0x5bbc8872
    .word 0x7fffffff
    .word 0x5bbc8872
    .word 0x7ffffffe
    .word 0x5bbc8872
    .word 0xffffffff
    .word 0x5bbc8872
    .word 0xfffffffe
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0x5bbc8872
    .word 0xaaaaaaaa
    .word 0x5bbc8872
    .word 0x55555555
    .word 0xaaaaaaaa
    .word 0x00000000
    .word 0xaaaaaaaa
    .word 0x00000001
    .word 0xaaaaaaaa
    .word 0x00000002
    .word 0xaaaaaaaa
    .word 0x80000000
    .word 0xaaaaaaaa
    .word 0x80000001
    .word 0xaaaaaaaa
    .word 0x7fffffff
    .word 0xaaaaaaaa
    .word 0x7ffffffe
    .word 0xaaaaaaaa
    .word 0xffffffff
    .word 0xaaaaaaaa
    .word 0xfffffffe
    .word 0xaaaaaaaa
    .word 0x5bbc8872
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0xaaaaaaaa
    .word 0x55555555
    .word 0x55555555
    .word 0x00000000
    .word 0x55555555
    .word 0x00000001
    .word 0x55555555
    .word 0x00000002
    .word 0x55555555
    .word 0x80000000
    .word 0x55555555
    .word 0x80000001
    .word 0x55555555
    .word 0x7fffffff
    .word 0x55555555
    .word 0x7ffffffe
    .word 0x55555555
    .word 0xffffffff
    .word 0x55555555
    .word 0xfffffffe
    .word 0x55555555
    .word 0x5bbc8872
    .word 0x55555555
    .word 0xaaaaaaaa
    .word 0x55555555
    .word 0x55555555
    .word 0x3b0abf30
    .word 0x639c4a01
    .word 0x2b1adbb8
    .word 0x89da5142
    .word 0x9f134ce1
    .word 0xeab15f50
    .word 0xbeca5ac0
    .word 0xa5595774
    .word 0x6f8e6afd
    .word 0x727d80fc
    .word 0xa307a3a6
    .word 0xdffcd93f
    .word 0x857fbb8c
    .word 0x6c26f19f
    .word 0x49731977
    .word 0x563f2056
    .word 0x3c52b5ec
    .word 0xa21abb0a
    .word 0x8934aeb0
    .word 0x30ad6ba4
    .word 0x02695c89
    .word 0x06d68808
    .word 0x0ca7e115
    .word 0x1eb33c93
    .word 0x6ccd9165
    .word 0xf7873c28
    .word 0x3c55197b
    .word 0xf0c129c5
    .word 0x25d1cda0
    .word 0xcafcf856
    .word 0x4cf29f92
    .word 0xdbe3d009
    .word 0x75dbe834
    .word 0x73d4b766
    .word 0x541c0d73
    .word 0xe4982b4e
    .word 0xe957797a
    .word 0xd488c840
    .word 0xa6bb39ef
    .word 0x471d5c13
    .word 0x63492b23
    .word 0x953395f3
    .word 0xc6837ba5
    .word 0x987974da
    .word 0xb6f26b28
    .word 0x81b08eca
    .word 0x8566132f
    .word 0x0cc35e40
    .word 0xb8c69043
    .word 0x4fd7fb75
    .word 0x3cf2d8e2
    .word 0xc4045122
    .word 0x5e40e8a5
    .word 0xd4954596
    .word 0xcfa5b9a1
    .word 0x9643bcfa
    .word 0xa9d4cf1a
    .word 0x07a15622
    .word 0x64566dca
    .word 0xe7ca12e6
    .word 0x674a861b
    .word 0xdc788394
    .word 0x70c3f3b2
    .word 0x293c5fbd
    .word 0xdad8c80c
    .word 0xd8fde627
    .word 0x13d230a8
    .word 0x2dc38077
    .word 0x14d2b4ae
    .word 0x6475c77f
    .word 0x210976e0
    .word 0x1d0ea0c7
    .word 0x40f76593
    .word 0x66da39c0
    .word 0x950d3da8
    .word 0xbbfc5568
    .word 0x93e13662
    .word 0xd4856578
    .word 0x4b83d603
    .word 0x49352329
    .word 0x1575438d
    .word 0xd4473d9e
    .word 0x1435e05b
    .word 0xb81b9c35
    .word 0x284ca876
    .word 0xe2e1c233
    .word 0xd4df032d
    .word 0x94ddf741
    .word 0x8ca89615
    .word 0xc721d506
    .word 0x40524d52
    .word 0xef53371d
    .word 0xd4297cd1
    .word 0xd31c6727
    .word 0xaad996a8
    .word 0x45603e7a
    .word 0xb6da2abf
    .word 0x5b13009d
    .word 0x65175ec0
    .word 0x3bbb2c2b
    .word 0xd44a85e2
    .word 0x8a29a4e0
    .word 0x99c8cf97
    .word 0xeb59aece
    .word 0x0310f2fa
    .word 0xb7d495d9
    .word 0x4b515ae6
    .word 0x7863c7ab
    .word 0xec28c191
    .word 0xe822b9d5
    .word 0x8d4de868
    .word 0x037dd25f
    .word 0x7370dd1a
    .word 0x8cf3785a
    .word 0xa7b2c47a
    .word 0x873f70d3
    .word 0xebfc02ff
    .word 0x77f1c376
    .word 0x03b73419
    .word 0x7f6630a3
    .word 0xa812ee41
    .word 0xd9be163b
    .word 0x8e9e4bba
    .word 0x34ccdb63
    .word 0xa6b63fea
    .word 0xf3844b43
    .word 0xdc29924b
    .word 0xfe96eca9
    .word 0x11c38f06
    .word 0x6cadc7ef
    .word 0xd5775b36
    .word 0x9616bc4e
    .word 0x445dd5d6
    .word 0xe4375136
    .word 0x74d90a87
    .word 0xc19c6366
    .word 0xabb2c353
    .word 0x5a19c166
    .word 0xf0b59163
    .word 0x1b379fa6
    .word 0x08fd4b09
    .word 0x07a9dbc3
    .word 0x41df21e3
    .word 0x7185dde1
    .word 0xc813c759
    .word 0x93559ff4
    .word 0xdd91a4d6
    .word 0x73b79244
    .word 0x0f653fb9
    .word 0x64305643
    .word 0xf2239287
    .word 0x853fd25e
    .word 0xff4c216e
    .word 0x49c42e8a
    .word 0xb140a3b3
    .word 0x94d4cecd
    .word 0xe9d5edb8
    .word 0xa22c5472
    .word 0x7dae30f7
    .word 0xed7fac23
    .word 0x2cb3eb5a
    .word 0xd6e5f23c
    .word 0x3dad2fc7
    .word 0xe0d24e92
    .word 0x3204c113
    .word 0x424c15fb
    .word 0x8a064d5f
    .word 0x62afbf47
    .word 0xef35d077
    .word 0x08b49946
    .word 0x801a2522
    .word 0x67058c65
    .word 0x2d2974ca
    .word 0x92188931
    .word 0x56267b65
    .word 0x26fd4608
    .word 0xa5aac909
    .word 0x6181f190
    .word 0xc5b09f99
    .word 0x356880c0
    .word 0xa346625a
    .word 0xc1d870de
    .word 0x33618588
    .word 0x3c552c59
    .word 0x33450207
    .word 0x02815859
    .word 0x33b1805a
    .word 0xda3ec045
    .word 0x98018d68
    .word 0x862215f9
    .word 0x75b2f4df
    .word 0xda4cc5e3
    .word 0x3aab7231
    .word 0x4a584c85
    .word 0xf991fce4
    .word 0x309f2cbe
    .word 0x2fa9008d
    .word 0xa9101faf
    .word 0xd750ccf6
    .word 0xe09868da
    .word 0x1f930592
    .word 0xc9651700
    .word 0x5cf04e6e
    .word 0x80e0bc7a
    .word 0xaf5c8f2c
    .word 0x6902a31d
    .word 0xd78d5eb5
    .word 0xe8b32256
    .word 0xf021ba8d
    .word 0x52442967
    .word 0xde8a6c21
    .word 0x9a6a75e9
    .word 0x149b8dc3
    .word 0x70b8ae2b
    .word 0x1ff796c9
    .word 0xcd2d175d
    .word 0xb0b178ee
    .word 0xb673eaa6
    .word 0xd816993e
    .word 0x5dc351c2
    .word 0x6f3e3200
    .word 0xc3f9a1b2
    .word 0xb990488b
    .word 0x02ad0ee5
    .word 0xb6dea232
    .word 0x612bb546
    .word 0x5439a97f
    .word 0xebbefb3f
    .word 0x6db29014
    .word 0xc8942b04
    .word 0x920b6e3a
    .word 0xe5a24262
    .word 0x517c4547
    .word 0xad43d325
    .word 0x88bd603e
    .word 0x286f9743
    .word 0x49780ca6
    .word 0x29bf4069
    .word 0xbdc0a76c
    .word 0x3c9cfdf3
    .word 0xc719c7a5
    .word 0x66154043
    .word 0xc9761a48
    .word 0x454ed176
    .word 0x4e54e998
    .word 0xff10bb19
    .word 0x04b9e694
    .word 0xd9ddecd9
    .word 0xd850e8ad
    .word 0xfe88380b
    .word 0x27b7876b
    .word 0x2d755a95
    .word 0xdf1dd270
    .word 0x67be7bcd
    .word 0x3a44d1d3
    .word 0x0458d60e

    // Testcase strings
canary_mismatch: .string "Testcase signature canary mismatch!"
test_1: .string "\"test: 1; cp: I_add_cg/cp_rs1\""
test_2: .string "\"test: 2; cp: I_add_cg/cp_rs1\""
test_3: .string "\"test: 3; cp: I_add_cg/cp_rs1\""
test_4: .string "\"test: 4; cp: I_add_cg/cp_rs1\""
test_5: .string "\"test: 5; cp: I_add_cg/cp_rs1\""
test_6: .string "\"test: 6; cp: I_add_cg/cp_rs1\""
test_7: .string "\"test: 7; cp: I_add_cg/cp_rs1\""
test_8: .string "\"test: 8; cp: I_add_cg/cp_rs1\""
test_9: .string "\"test: 9; cp: I_add_cg/cp_rs1\""
test_10: .string "\"test: 10; cp: I_add_cg/cp_rs1\""
test_11: .string "\"test: 11; cp: I_add_cg/cp_rs1\""
test_12: .string "\"test: 12; cp: I_add_cg/cp_rs1\""
test_13: .string "\"test: 13; cp: I_add_cg/cp_rs1\""
test_14: .string "\"test: 14; cp: I_add_cg/cp_rs1\""
test_15: .string "\"test: 15; cp: I_add_cg/cp_rs1\""
test_16: .string "\"test: 16; cp: I_add_cg/cp_rs1\""
test_17: .string "\"test: 17; cp: I_add_cg/cp_rs1\""
test_18: .string "\"test: 18; cp: I_add_cg/cp_rs1\""
test_19: .string "\"test: 19; cp: I_add_cg/cp_rs1\""
test_20: .string "\"test: 20; cp: I_add_cg/cp_rs1\""
test_21: .string "\"test: 21; cp: I_add_cg/cp_rs1\""
test_22: .string "\"test: 22; cp: I_add_cg/cp_rs1\""
test_23: .string "\"test: 23; cp: I_add_cg/cp_rs1\""
test_24: .string "\"test: 24; cp: I_add_cg/cp_rs1\""
test_25: .string "\"test: 25; cp: I_add_cg/cp_rs1\""
test_26: .string "\"test: 26; cp: I_add_cg/cp_rs1\""
test_27: .string "\"test: 27; cp: I_add_cg/cp_rs1\""
test_28: .string "\"test: 28; cp: I_add_cg/cp_rs1\""
test_29: .string "\"test: 29; cp: I_add_cg/cp_rs1\""
test_30: .string "\"test: 30; cp: I_add_cg/cp_rs1\""
test_31: .string "\"test: 31; cp: I_add_cg/cp_rs1\""
test_32: .string "\"test: 32; cp: I_add_cg/cp_rs1\""
test_33: .string "\"test: 33; cp: I_add_cg/cp_rs2\""
test_34: .string "\"test: 34; cp: I_add_cg/cp_rs2\""
test_35: .string "\"test: 35; cp: I_add_cg/cp_rs2\""
test_36: .string "\"test: 36; cp: I_add_cg/cp_rs2\""
test_37: .string "\"test: 37; cp: I_add_cg/cp_rs2\""
test_38: .string "\"test: 38; cp: I_add_cg/cp_rs2\""
test_39: .string "\"test: 39; cp: I_add_cg/cp_rs2\""
test_40: .string "\"test: 40; cp: I_add_cg/cp_rs2\""
test_41: .string "\"test: 41; cp: I_add_cg/cp_rs2\""
test_42: .string "\"test: 42; cp: I_add_cg/cp_rs2\""
test_43: .string "\"test: 43; cp: I_add_cg/cp_rs2\""
test_44: .string "\"test: 44; cp: I_add_cg/cp_rs2\""
test_45: .string "\"test: 45; cp: I_add_cg/cp_rs2\""
test_46: .string "\"test: 46; cp: I_add_cg/cp_rs2\""
test_47: .string "\"test: 47; cp: I_add_cg/cp_rs2\""
test_48: .string "\"test: 48; cp: I_add_cg/cp_rs2\""
test_49: .string "\"test: 49; cp: I_add_cg/cp_rs2\""
test_50: .string "\"test: 50; cp: I_add_cg/cp_rs2\""
test_51: .string "\"test: 51; cp: I_add_cg/cp_rs2\""
test_52: .string "\"test: 52; cp: I_add_cg/cp_rs2\""
test_53: .string "\"test: 53; cp: I_add_cg/cp_rs2\""
test_54: .string "\"test: 54; cp: I_add_cg/cp_rs2\""
test_55: .string "\"test: 55; cp: I_add_cg/cp_rs2\""
test_56: .string "\"test: 56; cp: I_add_cg/cp_rs2\""
test_57: .string "\"test: 57; cp: I_add_cg/cp_rs2\""
test_58: .string "\"test: 58; cp: I_add_cg/cp_rs2\""
test_59: .string "\"test: 59; cp: I_add_cg/cp_rs2\""
test_60: .string "\"test: 60; cp: I_add_cg/cp_rs2\""
test_61: .string "\"test: 61; cp: I_add_cg/cp_rs2\""
test_62: .string "\"test: 62; cp: I_add_cg/cp_rs2\""
test_63: .string "\"test: 63; cp: I_add_cg/cp_rs2\""
test_64: .string "\"test: 64; cp: I_add_cg/cp_rs2\""
test_65: .string "\"test: 65; cp: I_add_cg/cp_rd\""
test_66: .string "\"test: 66; cp: I_add_cg/cp_rd\""
test_67: .string "\"test: 67; cp: I_add_cg/cp_rd\""
test_68: .string "\"test: 68; cp: I_add_cg/cp_rd\""
test_69: .string "\"test: 69; cp: I_add_cg/cp_rd\""
test_70: .string "\"test: 70; cp: I_add_cg/cp_rd\""
test_71: .string "\"test: 71; cp: I_add_cg/cp_rd\""
test_72: .string "\"test: 72; cp: I_add_cg/cp_rd\""
test_73: .string "\"test: 73; cp: I_add_cg/cp_rd\""
test_74: .string "\"test: 74; cp: I_add_cg/cp_rd\""
test_75: .string "\"test: 75; cp: I_add_cg/cp_rd\""
test_76: .string "\"test: 76; cp: I_add_cg/cp_rd\""
test_77: .string "\"test: 77; cp: I_add_cg/cp_rd\""
test_78: .string "\"test: 78; cp: I_add_cg/cp_rd\""
test_79: .string "\"test: 79; cp: I_add_cg/cp_rd\""
test_80: .string "\"test: 80; cp: I_add_cg/cp_rd\""
test_81: .string "\"test: 81; cp: I_add_cg/cp_rd\""
test_82: .string "\"test: 82; cp: I_add_cg/cp_rd\""
test_83: .string "\"test: 83; cp: I_add_cg/cp_rd\""
test_84: .string "\"test: 84; cp: I_add_cg/cp_rd\""
test_85: .string "\"test: 85; cp: I_add_cg/cp_rd\""
test_86: .string "\"test: 86; cp: I_add_cg/cp_rd\""
test_87: .string "\"test: 87; cp: I_add_cg/cp_rd\""
test_88: .string "\"test: 88; cp: I_add_cg/cp_rd\""
test_89: .string "\"test: 89; cp: I_add_cg/cp_rd\""
test_90: .string "\"test: 90; cp: I_add_cg/cp_rd\""
test_91: .string "\"test: 91; cp: I_add_cg/cp_rd\""
test_92: .string "\"test: 92; cp: I_add_cg/cp_rd\""
test_93: .string "\"test: 93; cp: I_add_cg/cp_rd\""
test_94: .string "\"test: 94; cp: I_add_cg/cp_rd\""
test_95: .string "\"test: 95; cp: I_add_cg/cp_rd\""
test_96: .string "\"test: 96; cp: I_add_cg/cp_rd\""
test_97: .string "\"test: 97; cp: I_add_cg/cp_rs1_edges\""
test_98: .string "\"test: 98; cp: I_add_cg/cp_rs1_edges\""
test_99: .string "\"test: 99; cp: I_add_cg/cp_rs1_edges\""
test_100: .string "\"test: 100; cp: I_add_cg/cp_rs1_edges\""
test_101: .string "\"test: 101; cp: I_add_cg/cp_rs1_edges\""
test_102: .string "\"test: 102; cp: I_add_cg/cp_rs1_edges\""
test_103: .string "\"test: 103; cp: I_add_cg/cp_rs1_edges\""
test_104: .string "\"test: 104; cp: I_add_cg/cp_rs1_edges\""
test_105: .string "\"test: 105; cp: I_add_cg/cp_rs1_edges\""
test_106: .string "\"test: 106; cp: I_add_cg/cp_rs1_edges\""
test_107: .string "\"test: 107; cp: I_add_cg/cp_rs1_edges\""
test_108: .string "\"test: 108; cp: I_add_cg/cp_rs1_edges\""
test_109: .string "\"test: 109; cp: I_add_cg/cp_rs2_edges\""
test_110: .string "\"test: 110; cp: I_add_cg/cp_rs2_edges\""
test_111: .string "\"test: 111; cp: I_add_cg/cp_rs2_edges\""
test_112: .string "\"test: 112; cp: I_add_cg/cp_rs2_edges\""
test_113: .string "\"test: 113; cp: I_add_cg/cp_rs2_edges\""
test_114: .string "\"test: 114; cp: I_add_cg/cp_rs2_edges\""
test_115: .string "\"test: 115; cp: I_add_cg/cp_rs2_edges\""
test_116: .string "\"test: 116; cp: I_add_cg/cp_rs2_edges\""
test_117: .string "\"test: 117; cp: I_add_cg/cp_rs2_edges\""
test_118: .string "\"test: 118; cp: I_add_cg/cp_rs2_edges\""
test_119: .string "\"test: 119; cp: I_add_cg/cp_rs2_edges\""
test_120: .string "\"test: 120; cp: I_add_cg/cp_rs2_edges\""
test_121: .string "\"test: 121; cp: I_add_cg/cr_rs1_rs2_edges\""
test_122: .string "\"test: 122; cp: I_add_cg/cr_rs1_rs2_edges\""
test_123: .string "\"test: 123; cp: I_add_cg/cr_rs1_rs2_edges\""
test_124: .string "\"test: 124; cp: I_add_cg/cr_rs1_rs2_edges\""
test_125: .string "\"test: 125; cp: I_add_cg/cr_rs1_rs2_edges\""
test_126: .string "\"test: 126; cp: I_add_cg/cr_rs1_rs2_edges\""
test_127: .string "\"test: 127; cp: I_add_cg/cr_rs1_rs2_edges\""
test_128: .string "\"test: 128; cp: I_add_cg/cr_rs1_rs2_edges\""
test_129: .string "\"test: 129; cp: I_add_cg/cr_rs1_rs2_edges\""
test_130: .string "\"test: 130; cp: I_add_cg/cr_rs1_rs2_edges\""
test_131: .string "\"test: 131; cp: I_add_cg/cr_rs1_rs2_edges\""
test_132: .string "\"test: 132; cp: I_add_cg/cr_rs1_rs2_edges\""
test_133: .string "\"test: 133; cp: I_add_cg/cr_rs1_rs2_edges\""
test_134: .string "\"test: 134; cp: I_add_cg/cr_rs1_rs2_edges\""
test_135: .string "\"test: 135; cp: I_add_cg/cr_rs1_rs2_edges\""
test_136: .string "\"test: 136; cp: I_add_cg/cr_rs1_rs2_edges\""
test_137: .string "\"test: 137; cp: I_add_cg/cr_rs1_rs2_edges\""
test_138: .string "\"test: 138; cp: I_add_cg/cr_rs1_rs2_edges\""
test_139: .string "\"test: 139; cp: I_add_cg/cr_rs1_rs2_edges\""
test_140: .string "\"test: 140; cp: I_add_cg/cr_rs1_rs2_edges\""
test_141: .string "\"test: 141; cp: I_add_cg/cr_rs1_rs2_edges\""
test_142: .string "\"test: 142; cp: I_add_cg/cr_rs1_rs2_edges\""
test_143: .string "\"test: 143; cp: I_add_cg/cr_rs1_rs2_edges\""
test_144: .string "\"test: 144; cp: I_add_cg/cr_rs1_rs2_edges\""
test_145: .string "\"test: 145; cp: I_add_cg/cr_rs1_rs2_edges\""
test_146: .string "\"test: 146; cp: I_add_cg/cr_rs1_rs2_edges\""
test_147: .string "\"test: 147; cp: I_add_cg/cr_rs1_rs2_edges\""
test_148: .string "\"test: 148; cp: I_add_cg/cr_rs1_rs2_edges\""
test_149: .string "\"test: 149; cp: I_add_cg/cr_rs1_rs2_edges\""
test_150: .string "\"test: 150; cp: I_add_cg/cr_rs1_rs2_edges\""
test_151: .string "\"test: 151; cp: I_add_cg/cr_rs1_rs2_edges\""
test_152: .string "\"test: 152; cp: I_add_cg/cr_rs1_rs2_edges\""
test_153: .string "\"test: 153; cp: I_add_cg/cr_rs1_rs2_edges\""
test_154: .string "\"test: 154; cp: I_add_cg/cr_rs1_rs2_edges\""
test_155: .string "\"test: 155; cp: I_add_cg/cr_rs1_rs2_edges\""
test_156: .string "\"test: 156; cp: I_add_cg/cr_rs1_rs2_edges\""
test_157: .string "\"test: 157; cp: I_add_cg/cr_rs1_rs2_edges\""
test_158: .string "\"test: 158; cp: I_add_cg/cr_rs1_rs2_edges\""
test_159: .string "\"test: 159; cp: I_add_cg/cr_rs1_rs2_edges\""
test_160: .string "\"test: 160; cp: I_add_cg/cr_rs1_rs2_edges\""
test_161: .string "\"test: 161; cp: I_add_cg/cr_rs1_rs2_edges\""
test_162: .string "\"test: 162; cp: I_add_cg/cr_rs1_rs2_edges\""
test_163: .string "\"test: 163; cp: I_add_cg/cr_rs1_rs2_edges\""
test_164: .string "\"test: 164; cp: I_add_cg/cr_rs1_rs2_edges\""
test_165: .string "\"test: 165; cp: I_add_cg/cr_rs1_rs2_edges\""
test_166: .string "\"test: 166; cp: I_add_cg/cr_rs1_rs2_edges\""
test_167: .string "\"test: 167; cp: I_add_cg/cr_rs1_rs2_edges\""
test_168: .string "\"test: 168; cp: I_add_cg/cr_rs1_rs2_edges\""
test_169: .string "\"test: 169; cp: I_add_cg/cr_rs1_rs2_edges\""
test_170: .string "\"test: 170; cp: I_add_cg/cr_rs1_rs2_edges\""
test_171: .string "\"test: 171; cp: I_add_cg/cr_rs1_rs2_edges\""
test_172: .string "\"test: 172; cp: I_add_cg/cr_rs1_rs2_edges\""
test_173: .string "\"test: 173; cp: I_add_cg/cr_rs1_rs2_edges\""
test_174: .string "\"test: 174; cp: I_add_cg/cr_rs1_rs2_edges\""
test_175: .string "\"test: 175; cp: I_add_cg/cr_rs1_rs2_edges\""
test_176: .string "\"test: 176; cp: I_add_cg/cr_rs1_rs2_edges\""
test_177: .string "\"test: 177; cp: I_add_cg/cr_rs1_rs2_edges\""
test_178: .string "\"test: 178; cp: I_add_cg/cr_rs1_rs2_edges\""
test_179: .string "\"test: 179; cp: I_add_cg/cr_rs1_rs2_edges\""
test_180: .string "\"test: 180; cp: I_add_cg/cr_rs1_rs2_edges\""
test_181: .string "\"test: 181; cp: I_add_cg/cr_rs1_rs2_edges\""
test_182: .string "\"test: 182; cp: I_add_cg/cr_rs1_rs2_edges\""
test_183: .string "\"test: 183; cp: I_add_cg/cr_rs1_rs2_edges\""
test_184: .string "\"test: 184; cp: I_add_cg/cr_rs1_rs2_edges\""
test_185: .string "\"test: 185; cp: I_add_cg/cr_rs1_rs2_edges\""
test_186: .string "\"test: 186; cp: I_add_cg/cr_rs1_rs2_edges\""
test_187: .string "\"test: 187; cp: I_add_cg/cr_rs1_rs2_edges\""
test_188: .string "\"test: 188; cp: I_add_cg/cr_rs1_rs2_edges\""
test_189: .string "\"test: 189; cp: I_add_cg/cr_rs1_rs2_edges\""
test_190: .string "\"test: 190; cp: I_add_cg/cr_rs1_rs2_edges\""
test_191: .string "\"test: 191; cp: I_add_cg/cr_rs1_rs2_edges\""
test_192: .string "\"test: 192; cp: I_add_cg/cr_rs1_rs2_edges\""
test_193: .string "\"test: 193; cp: I_add_cg/cr_rs1_rs2_edges\""
test_194: .string "\"test: 194; cp: I_add_cg/cr_rs1_rs2_edges\""
test_195: .string "\"test: 195; cp: I_add_cg/cr_rs1_rs2_edges\""
test_196: .string "\"test: 196; cp: I_add_cg/cr_rs1_rs2_edges\""
test_197: .string "\"test: 197; cp: I_add_cg/cr_rs1_rs2_edges\""
test_198: .string "\"test: 198; cp: I_add_cg/cr_rs1_rs2_edges\""
test_199: .string "\"test: 199; cp: I_add_cg/cr_rs1_rs2_edges\""
test_200: .string "\"test: 200; cp: I_add_cg/cr_rs1_rs2_edges\""
test_201: .string "\"test: 201; cp: I_add_cg/cr_rs1_rs2_edges\""
test_202: .string "\"test: 202; cp: I_add_cg/cr_rs1_rs2_edges\""
test_203: .string "\"test: 203; cp: I_add_cg/cr_rs1_rs2_edges\""
test_204: .string "\"test: 204; cp: I_add_cg/cr_rs1_rs2_edges\""
test_205: .string "\"test: 205; cp: I_add_cg/cr_rs1_rs2_edges\""
test_206: .string "\"test: 206; cp: I_add_cg/cr_rs1_rs2_edges\""
test_207: .string "\"test: 207; cp: I_add_cg/cr_rs1_rs2_edges\""
test_208: .string "\"test: 208; cp: I_add_cg/cr_rs1_rs2_edges\""
test_209: .string "\"test: 209; cp: I_add_cg/cr_rs1_rs2_edges\""
test_210: .string "\"test: 210; cp: I_add_cg/cr_rs1_rs2_edges\""
test_211: .string "\"test: 211; cp: I_add_cg/cr_rs1_rs2_edges\""
test_212: .string "\"test: 212; cp: I_add_cg/cr_rs1_rs2_edges\""
test_213: .string "\"test: 213; cp: I_add_cg/cr_rs1_rs2_edges\""
test_214: .string "\"test: 214; cp: I_add_cg/cr_rs1_rs2_edges\""
test_215: .string "\"test: 215; cp: I_add_cg/cr_rs1_rs2_edges\""
test_216: .string "\"test: 216; cp: I_add_cg/cr_rs1_rs2_edges\""
test_217: .string "\"test: 217; cp: I_add_cg/cr_rs1_rs2_edges\""
test_218: .string "\"test: 218; cp: I_add_cg/cr_rs1_rs2_edges\""
test_219: .string "\"test: 219; cp: I_add_cg/cr_rs1_rs2_edges\""
test_220: .string "\"test: 220; cp: I_add_cg/cr_rs1_rs2_edges\""
test_221: .string "\"test: 221; cp: I_add_cg/cr_rs1_rs2_edges\""
test_222: .string "\"test: 222; cp: I_add_cg/cr_rs1_rs2_edges\""
test_223: .string "\"test: 223; cp: I_add_cg/cr_rs1_rs2_edges\""
test_224: .string "\"test: 224; cp: I_add_cg/cr_rs1_rs2_edges\""
test_225: .string "\"test: 225; cp: I_add_cg/cr_rs1_rs2_edges\""
test_226: .string "\"test: 226; cp: I_add_cg/cr_rs1_rs2_edges\""
test_227: .string "\"test: 227; cp: I_add_cg/cr_rs1_rs2_edges\""
test_228: .string "\"test: 228; cp: I_add_cg/cr_rs1_rs2_edges\""
test_229: .string "\"test: 229; cp: I_add_cg/cr_rs1_rs2_edges\""
test_230: .string "\"test: 230; cp: I_add_cg/cr_rs1_rs2_edges\""
test_231: .string "\"test: 231; cp: I_add_cg/cr_rs1_rs2_edges\""
test_232: .string "\"test: 232; cp: I_add_cg/cr_rs1_rs2_edges\""
test_233: .string "\"test: 233; cp: I_add_cg/cr_rs1_rs2_edges\""
test_234: .string "\"test: 234; cp: I_add_cg/cr_rs1_rs2_edges\""
test_235: .string "\"test: 235; cp: I_add_cg/cr_rs1_rs2_edges\""
test_236: .string "\"test: 236; cp: I_add_cg/cr_rs1_rs2_edges\""
test_237: .string "\"test: 237; cp: I_add_cg/cr_rs1_rs2_edges\""
test_238: .string "\"test: 238; cp: I_add_cg/cr_rs1_rs2_edges\""
test_239: .string "\"test: 239; cp: I_add_cg/cr_rs1_rs2_edges\""
test_240: .string "\"test: 240; cp: I_add_cg/cr_rs1_rs2_edges\""
test_241: .string "\"test: 241; cp: I_add_cg/cr_rs1_rs2_edges\""
test_242: .string "\"test: 242; cp: I_add_cg/cr_rs1_rs2_edges\""
test_243: .string "\"test: 243; cp: I_add_cg/cr_rs1_rs2_edges\""
test_244: .string "\"test: 244; cp: I_add_cg/cr_rs1_rs2_edges\""
test_245: .string "\"test: 245; cp: I_add_cg/cr_rs1_rs2_edges\""
test_246: .string "\"test: 246; cp: I_add_cg/cr_rs1_rs2_edges\""
test_247: .string "\"test: 247; cp: I_add_cg/cr_rs1_rs2_edges\""
test_248: .string "\"test: 248; cp: I_add_cg/cr_rs1_rs2_edges\""
test_249: .string "\"test: 249; cp: I_add_cg/cr_rs1_rs2_edges\""
test_250: .string "\"test: 250; cp: I_add_cg/cr_rs1_rs2_edges\""
test_251: .string "\"test: 251; cp: I_add_cg/cr_rs1_rs2_edges\""
test_252: .string "\"test: 252; cp: I_add_cg/cr_rs1_rs2_edges\""
test_253: .string "\"test: 253; cp: I_add_cg/cr_rs1_rs2_edges\""
test_254: .string "\"test: 254; cp: I_add_cg/cr_rs1_rs2_edges\""
test_255: .string "\"test: 255; cp: I_add_cg/cr_rs1_rs2_edges\""
test_256: .string "\"test: 256; cp: I_add_cg/cr_rs1_rs2_edges\""
test_257: .string "\"test: 257; cp: I_add_cg/cr_rs1_rs2_edges\""
test_258: .string "\"test: 258; cp: I_add_cg/cr_rs1_rs2_edges\""
test_259: .string "\"test: 259; cp: I_add_cg/cr_rs1_rs2_edges\""
test_260: .string "\"test: 260; cp: I_add_cg/cr_rs1_rs2_edges\""
test_261: .string "\"test: 261; cp: I_add_cg/cr_rs1_rs2_edges\""
test_262: .string "\"test: 262; cp: I_add_cg/cr_rs1_rs2_edges\""
test_263: .string "\"test: 263; cp: I_add_cg/cr_rs1_rs2_edges\""
test_264: .string "\"test: 264; cp: I_add_cg/cr_rs1_rs2_edges\""
test_265: .string "\"test: 265; cp: I_add_cg/cmp_rs1_rs2\""
test_266: .string "\"test: 266; cp: I_add_cg/cmp_rs1_rs2\""
test_267: .string "\"test: 267; cp: I_add_cg/cmp_rs1_rs2\""
test_268: .string "\"test: 268; cp: I_add_cg/cmp_rs1_rs2\""
test_269: .string "\"test: 269; cp: I_add_cg/cmp_rs1_rs2\""
test_270: .string "\"test: 270; cp: I_add_cg/cmp_rs1_rs2\""
test_271: .string "\"test: 271; cp: I_add_cg/cmp_rs1_rs2\""
test_272: .string "\"test: 272; cp: I_add_cg/cmp_rs1_rs2\""
test_273: .string "\"test: 273; cp: I_add_cg/cmp_rs1_rs2\""
test_274: .string "\"test: 274; cp: I_add_cg/cmp_rs1_rs2\""
test_275: .string "\"test: 275; cp: I_add_cg/cmp_rs1_rs2\""
test_276: .string "\"test: 276; cp: I_add_cg/cmp_rs1_rs2\""
test_277: .string "\"test: 277; cp: I_add_cg/cmp_rs1_rs2\""
test_278: .string "\"test: 278; cp: I_add_cg/cmp_rs1_rs2\""
test_279: .string "\"test: 279; cp: I_add_cg/cmp_rs1_rs2\""
test_280: .string "\"test: 280; cp: I_add_cg/cmp_rs1_rs2\""
test_281: .string "\"test: 281; cp: I_add_cg/cmp_rs1_rs2\""
test_282: .string "\"test: 282; cp: I_add_cg/cmp_rs1_rs2\""
test_283: .string "\"test: 283; cp: I_add_cg/cmp_rs1_rs2\""
test_284: .string "\"test: 284; cp: I_add_cg/cmp_rs1_rs2\""
test_285: .string "\"test: 285; cp: I_add_cg/cmp_rs1_rs2\""
test_286: .string "\"test: 286; cp: I_add_cg/cmp_rs1_rs2\""
test_287: .string "\"test: 287; cp: I_add_cg/cmp_rs1_rs2\""
test_288: .string "\"test: 288; cp: I_add_cg/cmp_rs1_rs2\""
test_289: .string "\"test: 289; cp: I_add_cg/cmp_rs1_rs2\""
test_290: .string "\"test: 290; cp: I_add_cg/cmp_rs1_rs2\""
test_291: .string "\"test: 291; cp: I_add_cg/cmp_rs1_rs2\""
test_292: .string "\"test: 292; cp: I_add_cg/cmp_rs1_rs2\""
test_293: .string "\"test: 293; cp: I_add_cg/cmp_rs1_rs2\""
test_294: .string "\"test: 294; cp: I_add_cg/cmp_rs1_rs2\""
test_295: .string "\"test: 295; cp: I_add_cg/cmp_rs1_rs2\""
test_296: .string "\"test: 296; cp: I_add_cg/cmp_rs1_rs2\""
test_297: .string "\"test: 297; cp: I_add_cg/cmp_rd_rs1\""
test_298: .string "\"test: 298; cp: I_add_cg/cmp_rd_rs1\""
test_299: .string "\"test: 299; cp: I_add_cg/cmp_rd_rs1\""
test_300: .string "\"test: 300; cp: I_add_cg/cmp_rd_rs1\""
test_301: .string "\"test: 301; cp: I_add_cg/cmp_rd_rs1\""
test_302: .string "\"test: 302; cp: I_add_cg/cmp_rd_rs1\""
test_303: .string "\"test: 303; cp: I_add_cg/cmp_rd_rs1\""
test_304: .string "\"test: 304; cp: I_add_cg/cmp_rd_rs1\""
test_305: .string "\"test: 305; cp: I_add_cg/cmp_rd_rs1\""
test_306: .string "\"test: 306; cp: I_add_cg/cmp_rd_rs1\""
test_307: .string "\"test: 307; cp: I_add_cg/cmp_rd_rs1\""
test_308: .string "\"test: 308; cp: I_add_cg/cmp_rd_rs1\""
test_309: .string "\"test: 309; cp: I_add_cg/cmp_rd_rs1\""
test_310: .string "\"test: 310; cp: I_add_cg/cmp_rd_rs1\""
test_311: .string "\"test: 311; cp: I_add_cg/cmp_rd_rs1\""
test_312: .string "\"test: 312; cp: I_add_cg/cmp_rd_rs1\""
test_313: .string "\"test: 313; cp: I_add_cg/cmp_rd_rs1\""
test_314: .string "\"test: 314; cp: I_add_cg/cmp_rd_rs1\""
test_315: .string "\"test: 315; cp: I_add_cg/cmp_rd_rs1\""
test_316: .string "\"test: 316; cp: I_add_cg/cmp_rd_rs1\""
test_317: .string "\"test: 317; cp: I_add_cg/cmp_rd_rs1\""
test_318: .string "\"test: 318; cp: I_add_cg/cmp_rd_rs1\""
test_319: .string "\"test: 319; cp: I_add_cg/cmp_rd_rs1\""
test_320: .string "\"test: 320; cp: I_add_cg/cmp_rd_rs1\""
test_321: .string "\"test: 321; cp: I_add_cg/cmp_rd_rs1\""
test_322: .string "\"test: 322; cp: I_add_cg/cmp_rd_rs1\""
test_323: .string "\"test: 323; cp: I_add_cg/cmp_rd_rs1\""
test_324: .string "\"test: 324; cp: I_add_cg/cmp_rd_rs1\""
test_325: .string "\"test: 325; cp: I_add_cg/cmp_rd_rs1\""
test_326: .string "\"test: 326; cp: I_add_cg/cmp_rd_rs1\""
test_327: .string "\"test: 327; cp: I_add_cg/cmp_rd_rs1\""
test_328: .string "\"test: 328; cp: I_add_cg/cmp_rd_rs1\""
test_329: .string "\"test: 329; cp: I_add_cg/cmp_rd_rs2\""
test_330: .string "\"test: 330; cp: I_add_cg/cmp_rd_rs2\""
test_331: .string "\"test: 331; cp: I_add_cg/cmp_rd_rs2\""
test_332: .string "\"test: 332; cp: I_add_cg/cmp_rd_rs2\""
test_333: .string "\"test: 333; cp: I_add_cg/cmp_rd_rs2\""
test_334: .string "\"test: 334; cp: I_add_cg/cmp_rd_rs2\""
test_335: .string "\"test: 335; cp: I_add_cg/cmp_rd_rs2\""
test_336: .string "\"test: 336; cp: I_add_cg/cmp_rd_rs2\""
test_337: .string "\"test: 337; cp: I_add_cg/cmp_rd_rs2\""
test_338: .string "\"test: 338; cp: I_add_cg/cmp_rd_rs2\""
test_339: .string "\"test: 339; cp: I_add_cg/cmp_rd_rs2\""
test_340: .string "\"test: 340; cp: I_add_cg/cmp_rd_rs2\""
test_341: .string "\"test: 341; cp: I_add_cg/cmp_rd_rs2\""
test_342: .string "\"test: 342; cp: I_add_cg/cmp_rd_rs2\""
test_343: .string "\"test: 343; cp: I_add_cg/cmp_rd_rs2\""
test_344: .string "\"test: 344; cp: I_add_cg/cmp_rd_rs2\""
test_345: .string "\"test: 345; cp: I_add_cg/cmp_rd_rs2\""
test_346: .string "\"test: 346; cp: I_add_cg/cmp_rd_rs2\""
test_347: .string "\"test: 347; cp: I_add_cg/cmp_rd_rs2\""
test_348: .string "\"test: 348; cp: I_add_cg/cmp_rd_rs2\""
test_349: .string "\"test: 349; cp: I_add_cg/cmp_rd_rs2\""
test_350: .string "\"test: 350; cp: I_add_cg/cmp_rd_rs2\""
test_351: .string "\"test: 351; cp: I_add_cg/cmp_rd_rs2\""
test_352: .string "\"test: 352; cp: I_add_cg/cmp_rd_rs2\""
test_353: .string "\"test: 353; cp: I_add_cg/cmp_rd_rs2\""
test_354: .string "\"test: 354; cp: I_add_cg/cmp_rd_rs2\""
test_355: .string "\"test: 355; cp: I_add_cg/cmp_rd_rs2\""
test_356: .string "\"test: 356; cp: I_add_cg/cmp_rd_rs2\""
test_357: .string "\"test: 357; cp: I_add_cg/cmp_rd_rs2\""
test_358: .string "\"test: 358; cp: I_add_cg/cmp_rd_rs2\""
test_359: .string "\"test: 359; cp: I_add_cg/cmp_rd_rs2\""
test_360: .string "\"test: 360; cp: I_add_cg/cmp_rd_rs2\""
test_361: .string "\"test: 361; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_362: .string "\"test: 362; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_363: .string "\"test: 363; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_364: .string "\"test: 364; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_365: .string "\"test: 365; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_366: .string "\"test: 366; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_367: .string "\"test: 367; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_368: .string "\"test: 368; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_369: .string "\"test: 369; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_370: .string "\"test: 370; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_371: .string "\"test: 371; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_372: .string "\"test: 372; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_373: .string "\"test: 373; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_374: .string "\"test: 374; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_375: .string "\"test: 375; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_376: .string "\"test: 376; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_377: .string "\"test: 377; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_378: .string "\"test: 378; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_379: .string "\"test: 379; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_380: .string "\"test: 380; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_381: .string "\"test: 381; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_382: .string "\"test: 382; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_383: .string "\"test: 383; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_384: .string "\"test: 384; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_385: .string "\"test: 385; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_386: .string "\"test: 386; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_387: .string "\"test: 387; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_388: .string "\"test: 388; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_389: .string "\"test: 389; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_390: .string "\"test: 390; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_391: .string "\"test: 391; cp: I_add_cg/cmp_rd_rs1_rs2\""
test_392: .string "\"test: 392; cp: I_add_cg/cmp_rd_rs1_rs2\""

// End of test data section and model specific data
RVTEST_DATA_END

// Signature region for self-checking
RVTEST_SIG_SETUP
