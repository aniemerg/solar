// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToFixedBytesGreaterSize.sol";

contract ConvertFixedBytesToFixedBytesGreaterSizeTest {
    ConvertFixedBytesToFixedBytesGreaterSize c;

    function setUp() public {
        c = new ConvertFixedBytesToFixedBytesGreaterSize();
    }

    function test_bytesToBytes() public view {
        // bytesToBytes(bytes2): "ab" -> "ab" (padded to bytes4, left-aligned)
        bytes4 result = c.bytesToBytes(bytes2("ab"));
        assert(result == bytes4(bytes2("ab")));
    }
}
