// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallInternalFunctionViaExpression.sol";

contract CallInternalFunctionViaExpressionTest {
    CallInternalFunctionViaExpression c;

    function setUp() public {
        c = new CallInternalFunctionViaExpression();
    }

    function test_associated_returns_42() public {
        assert(c.associated() == 42);
    }

    function test_unassociated_returns_42() public {
        assert(c.unassociated() == 42);
    }
}
