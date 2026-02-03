// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateSmokeTest {
    uint256 value1;
    uint256 value2;

    function get(uint8 which) public view returns (uint256) {
        if (which == 0) return value1;
        else return value2;
    }

    function set(uint8 which, uint256 value) public {
        if (which == 0) value1 = value;
        else value2 = value;
    }
}
