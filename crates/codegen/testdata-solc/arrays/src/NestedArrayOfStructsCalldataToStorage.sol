// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedArrayOfStructsCalldataToStorage {
    struct S {
        uint8[] a;
        uint8[2] b;
    }

    S[][] s1;
    S[][1] s2;
    S[1][] s3;

    function run1(S[][] calldata _a) public returns (S[][] memory){
        s1 = _a;
        return s1;
    }

    function run2(S[][1] calldata _a) public returns (S[][1] memory) {
        s2 = _a;
        return s2;
    }

    function run3(S[1][] calldata _a) public returns (S[1][] memory) {
        s3 = _a;
        return s3;
    }
}
