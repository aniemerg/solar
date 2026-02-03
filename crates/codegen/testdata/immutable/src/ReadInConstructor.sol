// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReadInConstructor {
    uint8 immutable a;
    uint8 x;

    constructor() {
        a = 3;
        x = a;
    }

    function readX() public view returns (uint8) {
        return x;
    }
}
