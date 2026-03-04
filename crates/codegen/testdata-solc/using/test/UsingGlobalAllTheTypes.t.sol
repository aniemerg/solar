// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingGlobalAllTheTypes.sol";

contract UsingGlobalAllTheTypesTest {
    UsingGlobalAllTheTypes c;

    function setUp() public {
        c = new UsingGlobalAllTheTypes();
    }

    function test_f() public view {
        // f() -> 1, 7, 9
        (uint a, uint b, uint cv) = c.f();
        assert(a == 1);
        assert(b == 7);
        assert(cv == 9);
    }
}
