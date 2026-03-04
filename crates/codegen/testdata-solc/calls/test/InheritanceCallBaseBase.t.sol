// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceCallBaseBase.sol";

contract InheritanceCallBaseBaseTest {
    InheritanceCallBaseBase c;

    function setUp() public {
        c = new InheritanceCallBaseBase();
    }

    function test_g_returns_12() public {
        // f is overridden to 3*n; g(4) = 3*4 = 12
        assert(c.g(4) == 12);
    }

    function test_h_returns_16() public {
        // s is not overridden; h(4) = 4*4 = 16
        assert(c.h(4) == 16);
    }
}
