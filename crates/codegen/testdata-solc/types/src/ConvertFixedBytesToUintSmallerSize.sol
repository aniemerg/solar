// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToUintSmallerSize {
    function bytesToUint(bytes4 s) public pure returns (uint16 h) {
        return uint16(uint32(s));
    }
}
