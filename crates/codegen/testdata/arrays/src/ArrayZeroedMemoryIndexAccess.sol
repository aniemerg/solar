// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayZeroedMemoryIndexAccess {
    mapping(string => uint256) map;

    function set(string memory s, uint256 n, uint256 a) public returns (uint256) {
        map[s] = 0;
        uint256[] memory x = new uint256[](n);
        return x[a];
    }
}
