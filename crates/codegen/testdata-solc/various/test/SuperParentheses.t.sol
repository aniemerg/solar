// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SuperParentheses.sol";

contract SuperParenthesesTest {
    SuperParentheses c;

    function setUp() public {
        c = new SuperParentheses();
    }

    function test_f() public {
        assert(c.f() == 15);
    }
}
