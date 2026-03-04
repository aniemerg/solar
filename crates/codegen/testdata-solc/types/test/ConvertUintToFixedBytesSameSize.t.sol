// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertUintToFixedBytesSameSize.sol";

contract ConvertUintToFixedBytesSameSizeTest {
    ConvertUintToFixedBytesSameSize c;

    function setUp() public {
        c = new ConvertUintToFixedBytesSameSize();
    }

    function test_uintToBytes() public view {
        // uintToBytes(uint256): left(0x616263) -> left(0x616263)
        // left(0x616263) means 0x616263 << (256-24) = stored in top bytes
        uint256 input = uint256(bytes32(bytes3(0x616263)));
        bytes32 result = c.uintToBytes(input);
        assert(result == bytes32(input));
    }
}
