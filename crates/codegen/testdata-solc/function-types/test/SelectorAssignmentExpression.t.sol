// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SelectorAssignmentExpression.sol";

contract SelectorAssignmentExpressionTest {
    function test_selectorAssignment() public {
        SelectorAssignmentExpression c = new SelectorAssignmentExpression();
        c.f();
        assert(c.z() == true);
    }
}
