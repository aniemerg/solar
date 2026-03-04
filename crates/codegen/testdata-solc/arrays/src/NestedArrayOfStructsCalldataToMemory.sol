// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedArrayOfStructsCalldataToMemory {
    struct S {
        uint8 x;
        uint8 y;
    }

    function run1(S[1][2] calldata a) public returns (S[1][2] memory) {
        return a;
    }

    function run2(S[1][] calldata a) public returns (S[1][] memory) {
        return a;
    }

    function run3(S[][2] calldata a) public returns (S[][2] memory) {
        return a;
    }
}
