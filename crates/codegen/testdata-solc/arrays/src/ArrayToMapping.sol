// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayToMapping {
    mapping (uint => uint8[][]) m;

    uint8[][] s;

    constructor() {
        s = new uint8[][](2);

        s[0] = new uint8[](2);
        s[0][0] = 10;
        s[0][1] = 11;

        s[1] = new uint8[](3);
        s[1][0] = 12;
        s[1][1] = 13;
        s[1][2] = 14;
    }

    function from_storage() public returns (uint8[][] memory) {
        m[0] = s;
        return m[0];
    }

    function from_storage_ptr() public returns (uint8[][] memory) {
        uint8[][] storage sPtr = s;
        m[0] = sPtr;
        return m[0];
    }

    function from_memory() public returns (uint8[][] memory) {
        uint8[][] memory a = s;
        m[0] = a;
        return m[0];
    }
}
