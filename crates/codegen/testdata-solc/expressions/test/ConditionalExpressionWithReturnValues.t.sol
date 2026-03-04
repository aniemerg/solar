// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionWithReturnValues.sol";

contract ConditionalExpressionWithReturnValuesTest {
    function test_conditionalReturnValues() public {
        ConditionalExpressionWithReturnValues c = new ConditionalExpressionWithReturnValues();
        (uint a1, uint b1) = c.f(true, 20);
        assert(a1 == 20 && b1 == 0);
        (uint a2, uint b2) = c.f(false, 20);
        assert(a2 == 0 && b2 == 20);
    }
}
