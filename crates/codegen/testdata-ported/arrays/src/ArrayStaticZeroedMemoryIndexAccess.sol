// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStaticZeroedMemoryIndexAccess {
    mapping(string => uint256) map;

    function set(string memory s) public returns (uint256) {
        map[s] = 0;
        uint256[3] memory x;
        return x[2];
    }
}
