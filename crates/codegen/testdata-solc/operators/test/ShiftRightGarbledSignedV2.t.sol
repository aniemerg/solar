// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightGarbledSignedV2.sol";

contract ShiftRightGarbledSignedV2Test {
    function test_ShiftRightGarbledSignedV2() public {
        C c = new C();
        // a is set to 0xfffffff0 in assembly, which sign-extends to int8 = -16
        // Then shifted right: -16 >> 3 = -2, >> 4 = -1
        assert(c.f(0, 0x03) == -2);
        assert(c.f(0, 0x04) == -1);
        assert(c.f(0, 0xff) == -1);
        // g: a set to 0xf0 = int8(-16), same sign extension
        assert(c.g(0, 0x03) == -2);
        assert(c.g(0, 0x04) == -1);
        assert(c.g(0, 0xff) == -1);
    }
}
