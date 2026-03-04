// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToFixedBytesSameSize.sol";

contract ConvertFixedBytesToFixedBytesSameSizeTest {
    ConvertFixedBytesToFixedBytesSameSize c;

    function setUp() public {
        c = new ConvertFixedBytesToFixedBytesSameSize();
    }

    function test_bytesToBytes() public view {
        // bytesToBytes(bytes4): "abcd" -> "abcd"
        bytes4 result = c.bytesToBytes(bytes4("abcd"));
        assert(result == bytes4("abcd"));
    }
}
