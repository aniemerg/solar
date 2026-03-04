// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierMultiInvocationViair.sol";

contract FunctionModifierMultiInvocationViairTest {
    FunctionModifierMultiInvocationViair c;

    function setUp() public {
        c = new FunctionModifierMultiInvocationViair();
    }

    function test_f_false() public {
        assert(c.f(false) == 1);
    }

    function test_f_true() public {
        // via-IR: each _ gets fresh r=0, returns 1; legacy: r accumulates to 2
        // Foundry uses legacy codegen by default
        assert(c.f(true) == 2);
    }
}
