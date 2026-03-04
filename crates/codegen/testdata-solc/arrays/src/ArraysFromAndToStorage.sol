// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysFromAndToStorage {
    uint24[] public data;
    function set(uint24[] memory _data) public returns (uint) {
        data = _data;
        return data.length;
    }
    function get() public returns (uint24[] memory) {
        return data;
    }
}
