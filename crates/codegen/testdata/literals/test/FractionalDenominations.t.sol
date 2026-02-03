// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FractionalDenominations.sol";

contract FractionalDenominationsTest {
    function test_FractionalDenominations() public {
        FractionalDenominations c = new FractionalDenominations();
        assert(c.g() == 1500000000);
        assert(c.e() == 1500000000000000000);
        assert(c.m() == 90);
        assert(c.h() == 5400);
        assert(c.d() == 129600);
        assert(c.w() == 907200);
    }
}
