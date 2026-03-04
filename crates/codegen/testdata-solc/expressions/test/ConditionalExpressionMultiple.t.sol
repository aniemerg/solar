// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionMultiple.sol";

contract ConditionalExpressionMultipleTest {
    function test_nestedConditional() public {
        ConditionalExpressionMultiple c = new ConditionalExpressionMultiple();
        assert(c.f(1001) == 1000);
        assert(c.f(500) == 100);
        assert(c.f(80) == 50);
        assert(c.f(40) == 10);
    }
}
