// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayArrayStatic {
    mapping(string => uint256) map;

    function set(string memory s, uint256 n, uint256 m) public returns (uint256) {
        map[s] = 0;
        uint256[4][] memory x = new uint256[4][](n);
        return x[m][0];
    }
}
