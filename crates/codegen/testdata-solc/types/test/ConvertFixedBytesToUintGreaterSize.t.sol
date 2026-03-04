// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToUintGreaterSize.sol";

contract ConvertFixedBytesToUintGreaterSizeTest {
    ConvertFixedBytesToUintGreaterSize c;

    function setUp() public {
        c = new ConvertFixedBytesToUintGreaterSize();
    }

    function test_bytesToUint() public view {
        // bytesToUint(bytes4): "abcd" -> 0x61626364
        uint64 result = c.bytesToUint(bytes4("abcd"));
        assert(result == 0x61626364);
    }
}
