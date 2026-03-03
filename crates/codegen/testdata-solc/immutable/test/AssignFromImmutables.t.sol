// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssignFromImmutables.sol";

contract AssignFromImmutablesTest {
    function test_AssignFromImmutables() public {
        AssignFromImmutables c = new AssignFromImmutables();
        assert(c.a() == 1);
        assert(c.b() == 1);
        assert(c.c() == 1);
        assert(c.d() == 1);
    }
}
