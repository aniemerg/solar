// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayPushStructFromCalldata {
    struct S {
        uint16 a;
        uint16 b;
        uint16[3] c;
        uint16[] d;
    }
    S[] data;

    function runTest(S calldata c) public returns (uint16, uint16, uint16, uint16) {
        data.push(c);
        return (data[0].a, data[0].b, data[0].c[2], data[0].d[2]);
    }
}
