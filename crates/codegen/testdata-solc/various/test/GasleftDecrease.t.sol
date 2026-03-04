// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GasleftDecrease.sol";

contract GasleftDecreaseTest {
    GasleftDecrease c;

    function setUp() public {
        c = new GasleftDecrease();
    }

    function test_f() public {
        assert(c.f() == true);
    }

    function test_g() public {
        assert(c.g() == true);
    }
}
