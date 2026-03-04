// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExplicitBaseClass.sol";

contract ExplicitBaseClassTest {
    Derived derived;

    function setUp() public {
        derived = new Derived();
    }

    function test_ExplicitBaseClass() public {
        assert(derived.g() == 3);
        assert(derived.f() == 1);
    }
}
