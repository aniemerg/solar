// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertUintToFixedBytesSameMinSize {
    function UintToBytes(uint8 h) public pure returns (bytes1 s) {
        return bytes1(h);
    }
}
