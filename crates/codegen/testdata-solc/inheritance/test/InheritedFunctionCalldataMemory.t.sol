// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedFunctionCalldataMemory.sol";

contract InheritedFunctionCalldataMemoryTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedFunctionCalldataMemory() public {
        assert(b.g() == 23);
    }
}
