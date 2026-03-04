// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToUintSameMinSize.sol";

contract ConvertFixedBytesToUintSameMinSizeTest {
    ConvertFixedBytesToUintSameMinSize c;

    function setUp() public {
        c = new ConvertFixedBytesToUintSameMinSize();
    }

    function test_bytesToUint() public view {
        // bytesToUint(bytes1): "a" -> 0x61
        uint8 result = c.bytesToUint(bytes1("a"));
        assert(result == 0x61);
    }
}
