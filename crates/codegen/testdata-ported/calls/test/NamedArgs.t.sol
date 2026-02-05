// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NamedArgs.sol";

contract NamedArgsTest {
    NamedArgs c;

    function setUp() public {
        c = new NamedArgs();
    }

    function test_NamedArgs() public view {
        assert(c.b() == 123);
        assert(c.c() == 123);
    }
}
