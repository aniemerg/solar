// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ScientificNotation.sol";

contract ScientificNotationTest {
    function test_ScientificNotation() public {
        ScientificNotation c = new ScientificNotation();
        assert(c.f() == 20000000000);
        assert(c.g() == 2);
        assert(c.h() == 25);
        assert(c.i() == -20000000000);
        assert(c.j() == -2);
        assert(c.k() == -25);
    }
}
