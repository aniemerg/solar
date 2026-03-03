// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmallTypesInReverse {
    uint16 public immutable a;
    uint16 public immutable b;
    uint16 public immutable c;
    uint16[3] public x;

    constructor() {
        c = 0xffff;
        b = 0x0f0f;
        a = 0x1234;
        x = [a, b, c];
    }
}
