// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertUintToFixedBytesSameMinSize.sol";

contract ConvertUintToFixedBytesSameMinSizeTest {
    ConvertUintToFixedBytesSameMinSize c;

    function setUp() public {
        c = new ConvertUintToFixedBytesSameMinSize();
    }

    function test_UintToBytes() public view {
        // UintToBytes(uint8): 0x61 -> "a"
        bytes1 result = c.UintToBytes(0x61);
        assert(result == bytes1("a"));
    }
}
