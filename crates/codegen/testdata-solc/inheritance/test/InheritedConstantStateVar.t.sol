// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedConstantStateVar.sol";

contract InheritedConstantStateVarTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedConstantStateVar() public {
        assert(b.f() == 7);
    }
}
