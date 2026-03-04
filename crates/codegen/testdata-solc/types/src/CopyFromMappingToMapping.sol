// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyFromMappingToMapping {
    struct S {
        uint8[3] x;
        uint8[][] y;
        uint16 z;
    }

    mapping (uint8 => S) src;
    mapping (uint8 => S) dst;

    constructor() {
        uint8[] memory d = new uint8[](2);
        d[0] = 3;
        d[1] = 4;

        uint8[][] memory y = new uint8[][](2);
        y[0] = d;
        y[1] = d;

        src[0] = S({x: [7, 8, 9], y: y, z: 13});
    }

    function f() public returns (S memory) {
        dst[0] = src[0];
        return dst[0];
    }
}
