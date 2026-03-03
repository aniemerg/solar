// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysComplexMemoryIndexAccess {
    function set(
        uint24[3][] memory _data,
        uint256 a,
        uint256 b
    ) public pure returns (uint256 l, uint256 e) {
        l = _data.length;
        e = _data[a][b];
    }
}
