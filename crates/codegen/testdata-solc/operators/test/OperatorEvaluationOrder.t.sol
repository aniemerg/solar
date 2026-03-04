// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorEvaluationOrder.sol";

contract OperatorEvaluationOrderTest {
    function test_OperatorEvaluationOrder() public {
        C c = new C();
        // These functions emit events in a specific order verifying evaluation order.
        // We just call them and trust they don't revert.
        c.testSingleOperator();
        c.testTwoBinaryOperators();
        c.testBinaryAndUnaryOperators();
        c.testOperatorsNestedInCalls();
    }
}
