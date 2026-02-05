// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunction.sol";

contract InternalLibraryFunctionTest {
    InternalLibraryFunction c;

    function setUp() public {
        c = new InternalLibraryFunction();
    }

    function test_InternalLibraryFunction() public view {
        assert(c.f() == 2);
    }
}
