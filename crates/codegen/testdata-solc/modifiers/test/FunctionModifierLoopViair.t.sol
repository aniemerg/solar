// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierLoopViair.sol";

contract FunctionModifierLoopViairTest {
    FunctionModifierLoopViair c;

    function setUp() public {
        c = new FunctionModifierLoopViair();
    }

    function test_f() public {
        // via-IR: each _ gets fresh r=0, returns 1; legacy: r accumulates to 10
        // Foundry uses legacy codegen by default
        assert(c.f() == 10);
    }
}
