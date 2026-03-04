// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringAndBytes {
    string public a;
    string public b;
    bytes public c;
    string public d = "abcd";
    constructor() {
        a = "hello world";
        b = hex"41424344";
        c = hex"ff077fff";
    }
}
