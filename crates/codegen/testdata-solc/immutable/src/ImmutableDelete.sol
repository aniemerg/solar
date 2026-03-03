// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmutableDelete {
    uint8 immutable public a;
    uint8 immutable public b = 0x42;
    uint public c;

    constructor() {
        delete a;
        delete b;
        c = b * 2 + a;
    }
}
