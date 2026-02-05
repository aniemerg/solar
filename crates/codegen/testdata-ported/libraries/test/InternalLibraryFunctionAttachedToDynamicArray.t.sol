// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToDynamicArray.sol";

contract InternalLibraryFunctionAttachedToDynamicArrayTest {
    InternalLibraryFunctionAttachedToDynamicArray c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToDynamicArray();
    }

    function test_InternalLibraryFunctionAttachedToDynamicArray() public view {
        assert(c.secondItem() == 0x22);
    }
}
