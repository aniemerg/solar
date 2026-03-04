// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalCallUnattachedWithParentheses.sol";

contract InternalCallUnattachedWithParenthesesTest {
    InternalCallUnattachedWithParentheses c;

    function setUp() public {
        c = new InternalCallUnattachedWithParentheses();
    }

    function test_foo() public {
        // foo() -> 3
        assert(c.foo() == 3);
    }
}
