// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays {
    uint8[][2] public a;
    constructor() {
        a[1].push(3);
        a[1].push(4);
    }
}
