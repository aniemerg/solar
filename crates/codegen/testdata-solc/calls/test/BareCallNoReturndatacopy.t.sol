// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BareCallNoReturndatacopy.sol";

contract BareCallNoReturndatacopyTest {
    BareCallNoReturndatacopy c;

    function setUp() public {
        c = new BareCallNoReturndatacopy();
    }

    function test_f_returns_true() public {
        assert(c.f() == true);
    }
}
