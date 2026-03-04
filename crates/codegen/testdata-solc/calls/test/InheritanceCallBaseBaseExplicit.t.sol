// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceCallBaseBaseExplicit.sol";

contract InheritanceCallBaseBaseExplicitTest {
    InheritanceCallBaseBaseExplicit c;

    function setUp() public {
        c = new InheritanceCallBaseBaseExplicit();
    }

    function test_g_returns_8() public {
        // explicitly calls BaseBase.f which returns 2*n; g(4) = 2*4 = 8
        assert(c.g(4) == 8);
    }

    function test_k_returns_16() public {
        // explicitly calls BaseBase.s which returns 4*n; k(4) = 4*4 = 16
        assert(c.k(4) == 16);
    }
}
