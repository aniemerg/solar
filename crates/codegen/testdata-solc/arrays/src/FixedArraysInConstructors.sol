// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedArraysInConstructors {
    uint256 public r;
    address public ch;

    constructor(address[3] memory s, uint256 x) {
        r = x;
        ch = s[2];
    }
}
