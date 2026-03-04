// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalPublicOverride.sol";

contract ExternalPublicOverrideTest {
    B c;

    function setUp() public {
        c = new B();
    }

    function test_f_returns_2() public {
        assert(c.f() == 2);
    }

    function test_g_returns_2() public {
        assert(c.g() == 2);
    }
}
