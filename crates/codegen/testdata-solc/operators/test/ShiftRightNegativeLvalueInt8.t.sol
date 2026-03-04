// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightNegativeLvalueInt8.sol";

contract ShiftRightNegativeLvalueInt8Test {
    function test_ShiftRightNegativeLvalueInt8() public {
        C c = new C();
        assert(c.f(-66, 0) == -66);
        assert(c.f(-66, 1) == -33);
        assert(c.f(-66, 4) == -5);
        assert(c.f(-66, 8) == -1);
        assert(c.f(-66, 16) == -1);
        assert(c.f(-66, 17) == -1);
        assert(c.f(-67, 0) == -67);
        assert(c.f(-67, 1) == -34);
        assert(c.f(-67, 4) == -5);
        assert(c.f(-67, 8) == -1);
        assert(c.f(-67, 16) == -1);
        assert(c.f(-67, 17) == -1);
    }
}
