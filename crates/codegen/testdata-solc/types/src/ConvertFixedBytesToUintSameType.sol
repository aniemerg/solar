// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToUintSameType {
    function bytesToUint(bytes32 s) public pure returns (uint256 h) {
        return uint(s);
    }
}
