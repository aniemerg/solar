// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceCallBase.sol";

contract InheritanceCallBaseTest {
    InheritanceCallBase c;

    function setUp() public {
        c = new InheritanceCallBase();
    }

    function test_g_returns_8() public {
        assert(c.g(4) == 8);
    }
}
