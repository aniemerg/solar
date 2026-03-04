// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssignmentToConstVarInvolvingExpression.sol";

contract AssignmentToConstVarInvolvingExpressionTest {
    AssignmentToConstVarInvolvingExpression c;

    function setUp() public {
        c = new AssignmentToConstVarInvolvingExpression();
    }

    function test_f() public {
        // 0x123 + 0x456 = 0x579, + 1 = 0x57a
        assert(c.f() == 0x57a);
    }
}
