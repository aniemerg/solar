// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AddressOverloadResolution.sol";

contract AddressOverloadResolutionTest {
    D d;

    function setUp() public {
        d = new D();
    }

    function test_AddressOverloadResolution() public {
        assert(d.f() == 1);
        assert(d.g() == 5);
    }
}
