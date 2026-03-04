// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionDifferentTypes.sol";

contract ConditionalExpressionDifferentTypesTest {
    function test_differentTypes() public {
        ConditionalExpressionDifferentTypes c = new ConditionalExpressionDifferentTypes();
        assert(c.f(true) == 0xcd);
        assert(c.f(false) == 0xabab);
    }
}
