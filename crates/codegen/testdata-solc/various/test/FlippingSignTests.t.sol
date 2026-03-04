// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FlippingSignTests.sol";

contract FlippingSignTestsTest {
    FlippingSignTests c;

    function setUp() public {
        c = new FlippingSignTests();
    }

    function test_f() public {
        assert(c.f() == true);
    }
}
