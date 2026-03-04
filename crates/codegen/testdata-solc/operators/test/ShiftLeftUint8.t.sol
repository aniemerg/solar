// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftLeftUint8.sol";

contract ShiftLeftUint8Test {
    function test_ShiftLeftUint8() public {
        C c = new C();
        assert(c.f(0x66, 0x0) == 0x66);
        assert(c.f(0x66, 0x8) == 0);
    }
}
