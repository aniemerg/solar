// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightGarbledV2.sol";

contract ShiftRightGarbledV2Test {
    function test_ShiftRightGarbledV2() public {
        C c = new C();
        // a is set to 0xffffffff in assembly, but uint8 cleanup zeroes high bytes -> 0xff
        // 0xff >> 4 = 0x0f
        assert(c.f(0x00, 0x04) == 0x0f);
    }
}
