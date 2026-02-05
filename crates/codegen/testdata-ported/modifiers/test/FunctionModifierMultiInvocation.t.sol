// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierMultiInvocation.sol";

contract FunctionModifierMultiInvocationTest {
    FunctionModifierMultiInvocation c;

    function setUp() public {
        c = new FunctionModifierMultiInvocation();
    }

    function test_FunctionModifierMultiInvocation() public {
        assert(c.f(false) == 1);
        assert(c.f(true) == 2);
    }
}
