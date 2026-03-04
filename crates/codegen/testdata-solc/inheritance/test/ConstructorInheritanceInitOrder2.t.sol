// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorInheritanceInitOrder2.sol";

contract ConstructorInheritanceInitOrder2Test {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_ConstructorInheritanceInitOrder2() public {
        assert(b.y() == 42);
    }
}
