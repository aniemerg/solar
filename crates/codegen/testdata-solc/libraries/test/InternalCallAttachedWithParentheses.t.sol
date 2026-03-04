// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalCallAttachedWithParentheses.sol";

contract InternalCallAttachedWithParenthesesTest {
    InternalCallAttachedWithParentheses c;

    function setUp() public {
        c = new InternalCallAttachedWithParentheses();
    }

    function test_f() public {
        // f() -> 0x0a (10)
        assert(c.f() == 10);
    }
}
