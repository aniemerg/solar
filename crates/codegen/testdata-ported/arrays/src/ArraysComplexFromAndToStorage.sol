// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysComplexFromAndToStorage {
    uint24[3][] public data;

    function set(uint24[3][] memory _data) public returns (uint256) {
        data = _data;
        return data.length;
    }

    function get() public view returns (uint24[3][] memory) {
        return data;
    }
}
