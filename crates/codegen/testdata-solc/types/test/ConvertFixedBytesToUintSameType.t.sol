// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToUintSameType.sol";

contract ConvertFixedBytesToUintSameTypeTest {
    ConvertFixedBytesToUintSameType c;

    function setUp() public {
        c = new ConvertFixedBytesToUintSameType();
    }

    function test_bytesToUint() public view {
        // bytesToUint(bytes32): "abc2" -> left(0x61626332)
        // "abc2" as bytes32 is 0x6162633200000000000000000000000000000000000000000000000000000000
        bytes32 input = bytes32(bytes4("abc2"));
        uint256 result = c.bytesToUint(input);
        assert(result == uint256(bytes32(bytes4("abc2"))));
    }
}
