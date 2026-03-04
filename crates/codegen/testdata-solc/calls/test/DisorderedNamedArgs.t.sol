// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DisorderedNamedArgs.sol";

contract DisorderedNamedArgsTest {
    DisorderedNamedArgs c;

    function setUp() public {
        c = new DisorderedNamedArgs();
    }

    function test_b_returns_123() public view {
        assert(c.b() == 123);
    }
}
