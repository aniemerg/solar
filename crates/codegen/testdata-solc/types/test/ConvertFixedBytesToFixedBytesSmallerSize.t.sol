// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToFixedBytesSmallerSize.sol";

contract ConvertFixedBytesToFixedBytesSmallerSizeTest {
    ConvertFixedBytesToFixedBytesSmallerSize c;

    function setUp() public {
        c = new ConvertFixedBytesToFixedBytesSmallerSize();
    }

    function test_bytesToBytes() public view {
        // bytesToBytes(bytes4): "abcd" -> "ab" (truncate to first 2 bytes)
        bytes2 result = c.bytesToBytes(bytes4("abcd"));
        assert(result == bytes2("ab"));
    }
}
