// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertUintToFixedBytesSameSize {
    function uintToBytes(uint256 h) public pure returns (bytes32 s) {
        return bytes32(h);
    }
}
