// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToFixedArray.sol";

contract InternalLibraryFunctionAttachedToFixedArrayTest {
    InternalLibraryFunctionAttachedToFixedArray c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToFixedArray();
    }

    function test_secondItem() public {
        // secondItem() -> 0x22
        assert(c.secondItem() == 0x22);
    }
}
