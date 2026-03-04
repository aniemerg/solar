// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LiteralEmptyString.sol";

contract LiteralEmptyStringTest {
    LiteralEmptyString c;

    function setUp() public {
        c = new LiteralEmptyString();
    }

    function test_initial_values() public view {
        assert(c.x() == 0);
        assert(c.a() == 0);
    }

    function test_g_sets_values() public {
        c.g();
        assert(c.x() == 0);
        assert(c.a() == 2);
    }
}
