// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceCallBaseExplicit.sol";

contract InheritanceCallBaseExplicitTest {
    InheritanceCallBaseExplicit c;

    function setUp() public {
        c = new InheritanceCallBaseExplicit();
    }

    function test_g_returns_8() public {
        assert(c.g(4) == 8);
    }
}
