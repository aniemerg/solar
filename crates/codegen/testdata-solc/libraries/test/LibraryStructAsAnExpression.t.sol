// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryStructAsAnExpression.sol";

contract LibraryStructAsAnExpressionTest {
    LibraryStructAsAnExpression c;

    function setUp() public {
        c = new LibraryStructAsAnExpression();
    }

    function test_f() public {
        // f() -> 1
        assert(c.f() == 1);
    }
}
