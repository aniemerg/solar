// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModuleFromTernaryExpression.sol";

contract ModuleFromTernaryExpressionTest {
    function test_moduleFromTernary() public {
        ModuleFromTernaryExpression c = new ModuleFromTernaryExpression();
        assert(c.f() == true);
    }
}
