// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayMemoryIndexAccess {
    function index(uint256 len) public pure returns (bool) {
        uint256[] memory array = new uint256[](len);
        for (uint256 i = 0; i < len; i++) array[i] = i + 1;
        for (uint256 i = 0; i < len; i++) require(array[i] == i + 1, "Unexpected value in array!");
        return array.length == len;
    }

    function accessIndex(uint256 len, int256 idx) public pure returns (uint256) {
        uint256[] memory array = new uint256[](len);
        for (uint256 i = 0; i < len; i++) array[i] = i + 1;
        return array[uint256(idx)];
    }
}
