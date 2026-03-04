// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToUintSameMinSize {
    function bytesToUint(bytes1 s) public pure returns (uint8 h) {
        return uint8(s);
    }
}
