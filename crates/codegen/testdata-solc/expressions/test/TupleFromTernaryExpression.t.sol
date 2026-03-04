// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TupleFromTernaryExpression.sol";

contract TupleFromTernaryExpressionTest {
    function test_tupleFromTernary() public {
        TupleFromTernaryExpression c = new TupleFromTernaryExpression();
        assert(c.f() == true);
    }
}
