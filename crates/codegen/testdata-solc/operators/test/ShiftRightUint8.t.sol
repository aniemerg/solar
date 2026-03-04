// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightUint8.sol";

contract ShiftRightUint8Test {
    function test_ShiftRightUint8() public {
        C c = new C();
        assert(c.f(0x66, 0x0) == 0x66);
        assert(c.f(0x66, 0x8) == 0x0);
    }
}
