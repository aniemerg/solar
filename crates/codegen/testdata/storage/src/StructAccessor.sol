// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructAccessor {
    struct Data {
        uint256 a;
        uint8 b;
        mapping(uint256 => uint256) c;
        bool d;
    }

    mapping(uint256 => Data) public data;

    constructor() {
        data[7].a = 1;
        data[7].b = 2;
        data[7].c[0] = 3;
        data[7].d = true;
    }
}
