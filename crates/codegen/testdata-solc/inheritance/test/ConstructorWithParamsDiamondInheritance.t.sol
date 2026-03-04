// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorWithParamsDiamondInheritance.sol";

contract ConstructorWithParamsDiamondInheritanceTest {
    D d;

    function setUp() public {
        d = new D(2, 0);
    }

    function test_ConstructorWithParamsDiamondInheritance() public {
        assert(d.i() == 2);
        assert(d.j() == 2);
        assert(d.k() == 1);
    }
}
