// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightUint32.sol";

contract ShiftRightUint32Test {
    function test_ShiftRightUint32() public {
        C c = new C();
        assert(c.f(0x4266, 0x0) == 0x4266);
        assert(c.f(0x4266, 0x8) == 0x42);
        assert(c.f(0x4266, 0x10) == 0);
        assert(c.f(0x4266, 0x11) == 0);
    }
}
