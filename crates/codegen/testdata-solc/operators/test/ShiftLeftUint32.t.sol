// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftLeftUint32.sol";

contract ShiftLeftUint32Test {
    function test_ShiftLeftUint32() public {
        C c = new C();
        assert(c.f(0x4266, 0x0) == 0x4266);
        assert(c.f(0x4266, 0x8) == 0x426600);
        assert(c.f(0x4266, 0x10) == 0x42660000);
        assert(c.f(0x4266, 0x11) == 0x84cc0000);
        assert(c.f(0x4266, 0x20) == 0);
    }
}
