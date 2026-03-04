// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertUintToFixedBytesSmallerSize.sol";

contract ConvertUintToFixedBytesSmallerSizeTest {
    ConvertUintToFixedBytesSmallerSize c;

    function setUp() public {
        c = new ConvertUintToFixedBytesSmallerSize();
    }

    function test_uintToBytes() public view {
        // uintToBytes(uint32): 0x61626364 -> "cd"
        // uint16(0x61626364) = 0x6364, bytes2(0x6364) = "cd"
        bytes2 result = c.uintToBytes(0x61626364);
        assert(result == bytes2("cd"));
    }
}
