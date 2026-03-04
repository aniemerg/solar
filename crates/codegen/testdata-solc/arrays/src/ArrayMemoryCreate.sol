// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayMemoryCreate {
    function create(uint256 len) public returns (uint256) {
        uint[] memory array = new uint[](len);
        return array.length;
    }
}
