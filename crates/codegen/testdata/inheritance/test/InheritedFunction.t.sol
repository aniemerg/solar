// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedFunction.sol";

contract InheritedFunctionTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedFunction() public {
        assert(b.g() == 1);
    }
}
