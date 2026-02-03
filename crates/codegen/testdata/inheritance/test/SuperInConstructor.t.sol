// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SuperInConstructor.sol";

contract SuperInConstructorTest {
    SuperInConstructorD d;

    function setUp() public {
        d = new SuperInConstructorD();
    }

    function test_SuperInConstructor() public {
        assert(d.f() == 15);
    }
}
