// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryTypesInitialization {
    mapping(uint256 => uint256) data;

    function stat() public returns (uint256[5] memory) {
        data[2] = 3;
    }

    function dyn() public returns (uint256[] memory) {
        stat();
    }

    function nested() public returns (uint256[3][] memory) {
        stat();
    }

    function nestedStat() public returns (uint256[3][7] memory) {
        stat();
    }
}
