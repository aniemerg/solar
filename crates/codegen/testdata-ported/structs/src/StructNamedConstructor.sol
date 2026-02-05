// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructNamedConstructor {
    struct S {
        uint256 a;
        bool x;
    }

    S public s;

    constructor() {
        s = S({x: true, a: 1});
    }
}
