// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToInteger.sol";

contract InternalLibraryFunctionAttachedToIntegerTest {
    InternalLibraryFunctionAttachedToInteger c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToInteger();
    }

    function test_InternalLibraryFunctionAttachedToInteger() public view {
        assert(c.foo(8, 42) == 50);
    }
}
