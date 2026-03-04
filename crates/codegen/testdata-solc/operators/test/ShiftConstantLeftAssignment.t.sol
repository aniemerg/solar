// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftConstantLeftAssignment.sol";

contract ShiftConstantLeftAssignmentTest {
    function test_ShiftConstantLeftAssignment() public {
        C c = new C();
        assert(c.f() == 0x4200);
    }
}
