// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierLoop.sol";

contract FunctionModifierLoopTest {
    FunctionModifierLoop c;

    function setUp() public {
        c = new FunctionModifierLoop();
    }

    function test_FunctionModifierLoop() public {
        assert(c.f() == 10);
    }
}
