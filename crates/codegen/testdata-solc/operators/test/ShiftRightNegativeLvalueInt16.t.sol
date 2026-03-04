// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightNegativeLvalueInt16.sol";

contract ShiftRightNegativeLvalueInt16Test {
    function test_ShiftRightNegativeLvalueInt16() public {
        C c = new C();
        assert(c.f(-4266, 0) == -4266);
        assert(c.f(-4266, 1) == -2133);
        assert(c.f(-4266, 4) == -267);
        assert(c.f(-4266, 8) == -17);
        assert(c.f(-4266, 16) == -1);
        assert(c.f(-4266, 17) == -1);
        assert(c.f(-4267, 0) == -4267);
        assert(c.f(-4267, 1) == -2134);
        assert(c.f(-4267, 4) == -267);
        assert(c.f(-4267, 8) == -17);
        assert(c.f(-4267, 16) == -1);
        assert(c.f(-4267, 17) == -1);
    }
}
