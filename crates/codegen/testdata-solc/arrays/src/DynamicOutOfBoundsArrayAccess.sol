// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicOutOfBoundsArrayAccess {
    uint256[] data;

    function enlarge(uint256 amount) public returns (uint256) {
        while (data.length < amount) data.push();
        return data.length;
    }

    function set(uint256 index, uint256 value) public returns (bool) {
        data[index] = value;
        return true;
    }

    function get(uint256 index) public returns (uint256) {
        return data[index];
    }

    function length() public returns (uint256) {
        return data.length;
    }
}
