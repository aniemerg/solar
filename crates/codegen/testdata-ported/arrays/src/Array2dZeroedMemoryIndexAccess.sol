// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array2dZeroedMemoryIndexAccess {
    mapping(string => uint256) map;

    function set(
        string memory s,
        uint256 n,
        uint256 m,
        uint256 a,
        uint256 b
    ) public returns (uint256) {
        map[s] = 0;
        uint256[][] memory x = new uint256[][](n);
        for (uint256 i = 0; i < n; ++i) {
            x[i] = new uint256[](m);
        }
        return x[a][b];
    }
}
