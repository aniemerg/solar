// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedArrayOfStructsMemoryToMemory {
    struct S {
        uint8 x;
        uint8 y;
    }

    function run1(S[1][2] memory a) public returns (S[1][2] memory r) {
        r = a;
    }

    function run2(S[1][] memory a) public returns (S[1][] memory r) {
        r = a;
    }

    function run3(S[][2] memory a) public returns (S[][2] memory r) {
        r = a;
    }
}
