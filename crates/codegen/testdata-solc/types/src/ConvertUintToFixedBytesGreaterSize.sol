// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertUintToFixedBytesGreaterSize {
    function UintToBytes(uint16 h) public pure returns (bytes8 s) {
        return bytes8(uint64(h));
    }
}
