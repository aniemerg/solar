// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierLocalVariables.sol";

contract FunctionModifierLocalVariablesTest {
    FunctionModifierLocalVariables c;

    function setUp() public {
        c = new FunctionModifierLocalVariables();
    }

    function test_f_true() public {
        assert(c.f(true) == 0);
    }

    function test_f_false() public {
        assert(c.f(false) == 3);
    }
}
