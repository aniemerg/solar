// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorWithParamsInheritance.sol";

contract ConstructorWithParamsInheritanceTest {
    D d;

    function setUp() public {
        d = new D(2, 0);
    }

    function test_ConstructorWithParamsInheritance() public {
        assert(d.i() == 2);
        assert(d.k() == 1);
    }
}
