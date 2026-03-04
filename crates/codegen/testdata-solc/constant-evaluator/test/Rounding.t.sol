// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Rounding.sol";

contract RoundingTest {
    function test_f() public {
        Rounding c = new Rounding();
        (uint xl, int cv, uint yl, int nd) = c.f();
        assert(xl == 2);
        assert(cv == 2);
        assert(yl == 2);
        assert(nd == 2);
    }
}
