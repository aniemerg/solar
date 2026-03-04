// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedFunctionCalldataMemoryInterface.sol";

contract InheritedFunctionCalldataMemoryInterfaceTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedFunctionCalldataMemoryInterface() public {
        assert(b.g() == 42);
    }
}
