// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UnaryTooLongLiteral.sol";

contract UnaryTooLongLiteralTest {
    function test_unaryTooLongLiteral() public {
        UnaryTooLongLiteral c = new UnaryTooLongLiteral();
        assert(c.f() == true);
    }
}
