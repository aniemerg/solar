// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultipleInitializationsA {
    uint immutable x = x + 1;
    uint immutable y = x += 2;

    constructor(uint) m(x += 16) m(x += 32) {
        x += 64;
        x += 128;
    }

    modifier m(uint) {
        _;
    }

    function get() public returns (uint) {
        return x;
    }
}

contract MultipleInitializationsB is MultipleInitializationsA(MultipleInitializationsA.x += 8) {
    constructor(uint) {}
}

contract MultipleInitializationsC is MultipleInitializationsB {
    constructor() MultipleInitializationsB(x += 4) {}
}
