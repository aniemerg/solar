// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToStringMemory.sol";

contract InternalLibraryFunctionAttachedToStringMemoryTest {
    InternalLibraryFunctionAttachedToStringMemory c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToStringMemory();
    }

    function test_InternalLibraryFunctionAttachedToStringMemory() public view {
        assert(c.secondChar() == 98);
    }
}
