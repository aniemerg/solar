// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierEmpty.sol";

contract FunctionModifierEmptyTest {
    FunctionModifierEmpty c;

    function setUp() public {
        c = new FunctionModifierEmpty();
    }

    function test_f() public {
        assert(c.f() == false);
    }
}
