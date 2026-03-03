// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpression.sol";

contract ConditionalExpressionTest {
    function test_ConditionalExpression_Literals() public {
        ConditionalExpression c = new ConditionalExpression();
        assert(c.trueLiteral() == 5);
        assert(c.falseLiteral() == 10);
    }
}
