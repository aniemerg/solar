// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertUintToFixedBytesSmallerSize {
    function uintToBytes(uint32 h) public pure returns (bytes2 s) {
        return bytes2(uint16(h));
    }
}
