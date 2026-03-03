// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunReadInCtor {
    uint8 immutable a;
    uint8 x;

    constructor() {
        a = 3;
        x = readA();
    }

    function readX() public view returns (uint8) {
        return x;
    }

    function readA() public view returns (uint8) {
        return a;
    }
}
