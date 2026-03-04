// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Super.sol";

contract SuperTest {
    Super c;

    function setUp() public {
        c = new Super();
    }

    function test_f() public {
        assert(c.f() == 15);
    }
}
