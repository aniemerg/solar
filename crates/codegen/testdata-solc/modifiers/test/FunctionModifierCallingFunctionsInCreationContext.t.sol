// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierCallingFunctionsInCreationContext.sol";

contract FunctionModifierCallingFunctionsInCreationContextTest {
    FunctionModifierCallingFunctionsInCreationContext c;

    function setUp() public {
        c = new FunctionModifierCallingFunctionsInCreationContext();
    }

    function test_getData() public {
        assert(c.getData() == 0x4300);
    }
}
