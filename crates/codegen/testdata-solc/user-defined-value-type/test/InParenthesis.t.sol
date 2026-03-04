// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InParenthesis.sol";

contract InParenthesisTest {
    function test_parenthesizedWrapUnwrap() public {
        InParenthesis c = new InParenthesis();
        (MyInt a, int b) = c.f();
        assert(MyInt.unwrap(a) == 5);
        assert(b == 10);
    }
}
