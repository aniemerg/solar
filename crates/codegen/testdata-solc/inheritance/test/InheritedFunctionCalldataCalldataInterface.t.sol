// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedFunctionCalldataCalldataInterface.sol";

contract InheritedFunctionCalldataCalldataInterfaceTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedFunctionCalldataCalldataInterface() public {
        assert(b.g() == 42);
    }
}
