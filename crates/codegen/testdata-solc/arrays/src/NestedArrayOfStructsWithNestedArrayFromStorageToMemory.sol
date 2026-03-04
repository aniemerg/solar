// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedArrayOfStructsWithNestedArrayFromStorageToMemory {
    struct S {
        uint8[] a;
        uint8[2] b;
    }

    uint8[] a1;
    uint8[] a2;
    uint8[] a3;

    S[][] s1;
    S[1][1] s2;

    constructor() {
        a1.push(23);
        a1.push(29);
        a2.push(31);

        s1 = new S[][](2);
        s1[0] = new S[](2);
        s1[0][0] = S({a: a1, b: [7, 11]});
        s1[0][1] = S({a: a2, b: [17, 19]});

        s1[1] = new S[](1);
        s1[1][0] = S({a: a3, b: [37, 41]});

        s2[0][0] = S({a: a3, b: [43, 47]});
    }

    function run1() public returns (S[] memory) {
        return s1[0];
    }

    function run2() public returns (S[1] memory) {
        return s2[0];
    }
}
