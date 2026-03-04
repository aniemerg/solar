// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightAssignment.sol";

contract ShiftRightAssignmentTest {
    function test_ShiftRightAssignment() public {
        C c = new C();
        assert(c.f(0x4266, 0x0) == 0x4266);
        assert(c.f(0x4266, 0x8) == 0x42);
        assert(c.f(0x4266, 0x10) == 0);
        assert(c.f(0x4266, 0x11) == 0);
    }
}
