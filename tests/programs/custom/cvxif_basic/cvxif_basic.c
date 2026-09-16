/*
**
** Copyright (c) 2026 Eclipse Foundation
**
** Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     https://solderpad.org/licenses/
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
**
*******************************************************************************
**
** Firmware test for CV-X-IF basic operation on CV32E20X.
** Exercises the coprocessor-slave interface with CUS-ADD instructions,
** verifying register read/write through the CV-X-IF agent.
**
*******************************************************************************
*/

#include <stdio.h>
#include <stdlib.h>

#include "cv32e20_dv.h"

// CUS-ADD custom instruction encoding for CV-X-IF.
// The CVE2 core decodes an unrecognised opcode as illegal and, with the
// coprocessor interface enabled, issues it to the CV-X-IF slave.  The slave
// returns the add result (rs1 + rs2) which the core writes back to rd.
//
// Opcode CUSTOM_3 (0x7b), funct3=0, funct7=0.  This is the canonical CUS-ADD
// encoding used by the riscv-isa-sim cvxif extension.  The numeric opcode is
// used (rather than the CUSTOM_3 mnemonic) for portability with toolchains
// whose encoding.h does not define the CUSTOM_3 symbolic opcode.
#define CUS_ADD(rd, rs1, rs2) \
    __asm__ volatile(".insn r 0x7B, 0, 0, %0, %1, %2" \
                     : "=r"(rd) : "r"(rs1), "r"(rs2))

int main(int argc, char *argv[])
{
    unsigned int rs1 = 8;
    unsigned int rs2 = 9;
    unsigned int result, expected_result;
    unsigned int rvenderid;
    unsigned int misa;

    /* Read MVENDORID and MISA CSRs to verify core identification */
    __asm__ volatile("csrr %0, 0xF11" : "=r"(rvenderid));
    __asm__ volatile("csrr %0, 0x301" : "=r"(misa));

    printf("CV-X-IF firmware test\n");
    printf("MVENDORID = 0x%x\n", rvenderid);
    printf("MISA      = 0x%x\n", misa);

    printf("Issuing CUS-ADD with rs1=%u, rs2=%u\n", rs1, rs2);

    /* Issue the CUS-ADD custom instruction.  The core requests the
     * coprocessor over the CV-X-IF and waits for the writeback result. */
    CUS_ADD(result, rs1, rs2);
    expected_result = rs1 + rs2;

    if (result == expected_result) {
        printf("SUCCESS: CUS-ADD result = %u (expected %u)\n", result, expected_result);
        TEST_PASSED;
        return EXIT_SUCCESS;
    } else {
        printf("FAILURE: CUS-ADD result = %u (expected %u)\n", result, expected_result);
        TEST_FAILED;
        return EXIT_FAILURE;
    }
}
