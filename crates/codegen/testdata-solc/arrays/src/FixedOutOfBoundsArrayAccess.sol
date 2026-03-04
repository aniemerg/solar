// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedOutOfBoundsArrayAccess {
    uint256[4] data;

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
