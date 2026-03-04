// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftConstantRightAssignment.sol";

contract ShiftConstantRightAssignmentTest {
    function test_ShiftConstantRightAssignment() public {
        C c = new C();
        assert(c.f() == 0x42);
    }
}
