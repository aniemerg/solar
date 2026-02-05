// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToFixedBytes.sol";

contract InternalLibraryFunctionAttachedToFixedBytesTest {
    InternalLibraryFunctionAttachedToFixedBytes c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToFixedBytes();
    }

    function test_InternalLibraryFunctionAttachedToFixedBytes() public view {
        bytes2 a = 0x1100;
        bytes2 b = 0x0022;
        bytes2 r = c.sum(a, b);
        assert(r == 0x1122);
    }
}
