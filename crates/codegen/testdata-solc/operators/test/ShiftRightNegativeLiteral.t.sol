// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftRightNegativeLiteral.sol";

contract ShiftRightNegativeLiteralTest {
    function test_ShiftRightNegativeLiteral() public {
        C c = new C();
        assert(c.f1() == true);
        assert(c.f2() == true);
        assert(c.f3() == true);
        assert(c.f4() == true);
        assert(c.f5() == true);
        assert(c.f6() == true);
        assert(c.g1() == true);
        assert(c.g2() == true);
        assert(c.g3() == true);
        assert(c.g4() == true);
        assert(c.g5() == true);
        assert(c.g6() == true);
    }
}
