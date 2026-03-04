// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionTuples.sol";

contract ConditionalExpressionTuplesTest {
    function test_tupleTernary() public {
        ConditionalExpressionTuples c = new ConditionalExpressionTuples();
        (uint a, uint b) = c.f(true);
        assert(a == 1 && b == 2);
        (uint x, uint y) = c.f(false);
        assert(x == 3 && y == 4);
    }
}
