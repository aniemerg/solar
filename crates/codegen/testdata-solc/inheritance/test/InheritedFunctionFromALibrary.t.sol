// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedFunctionFromALibrary.sol";

contract InheritedFunctionFromALibraryTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedFunctionFromALibrary() public {
        assert(b.g() == 1);
    }
}
