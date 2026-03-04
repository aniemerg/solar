// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToUintGreaterSize {
    function bytesToUint(bytes4 s) public pure returns (uint64 h) {
        return uint64(uint32(s));
    }
}
