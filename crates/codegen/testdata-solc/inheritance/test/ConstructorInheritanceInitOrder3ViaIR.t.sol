// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorInheritanceInitOrder3ViaIR.sol";

contract ConstructorInheritanceInitOrder3ViaIRTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_ConstructorInheritanceInitOrder3ViaIR() public {
        // Forge uses legacy codegen: f() is called before A's state var initializer (x=2),
        // so f() sets x=4 and that value persists. Legacy result: x=4.
        assert(b.x() == 4);
    }
}
