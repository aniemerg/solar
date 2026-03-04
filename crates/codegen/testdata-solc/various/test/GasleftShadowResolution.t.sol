// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GasleftShadowResolution.sol";

contract GasleftShadowResolutionTest {
    GasleftShadowResolution c;

    function setUp() public {
        c = new GasleftShadowResolution();
    }

    function test_f() public {
        assert(c.f() == 0);
    }
}
