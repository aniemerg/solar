// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryEnumAsAnExpression.sol";

contract LibraryEnumAsAnExpressionTest {
    LibraryEnumAsAnExpression c;

    function setUp() public {
        c = new LibraryEnumAsAnExpression();
    }

    function test_f() public {
        // f() -> 1
        assert(c.f() == 1);
    }
}
