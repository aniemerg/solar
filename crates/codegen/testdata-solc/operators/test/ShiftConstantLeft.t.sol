// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftConstantLeft.sol";

contract ShiftConstantLeftTest {
    function test_ShiftConstantLeft() public {
        C c = new C();
        assert(c.a() == 0x4200);
    }
}
