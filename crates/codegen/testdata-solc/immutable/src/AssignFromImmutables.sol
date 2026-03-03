// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssignFromImmutables {
    uint immutable public a;
    uint immutable public b;
    uint immutable public c;
    uint immutable public d;

    constructor() {
        a = 1;
        b = a;
        c = b;
        d = c;
    }
}
