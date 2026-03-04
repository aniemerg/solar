// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionFunctions.sol";

contract ConditionalExpressionFunctionsTest {
    function test_functionPointerConditional() public {
        ConditionalExpressionFunctions c = new ConditionalExpressionFunctions();
        assert(c.f(true) == 1);
        assert(c.f(false) == 2);
    }
}
