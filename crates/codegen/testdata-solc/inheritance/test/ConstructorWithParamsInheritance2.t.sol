// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorWithParamsInheritance2.sol";

contract ConstructorWithParamsInheritance2Test {
    D d;

    function setUp() public {
        d = new D();
    }

    function test_ConstructorWithParamsInheritance2() public {
        assert(d.i() == 2);
        assert(d.k() == 1);
    }
}
