// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftConstantRight.sol";

contract ShiftConstantRightTest {
    function test_ShiftConstantRight() public {
        C c = new C();
        assert(c.a() == 0x42);
    }
}
