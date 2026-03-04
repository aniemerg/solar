// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructMediocreStruct {
    struct S { StructMediocreStruct c; }
    function f(uint a, S[2] memory s1, uint b) public returns (uint r1, StructMediocreStruct r2, uint r3) {
        r1 = a;
        r2 = s1[0].c;
        r3 = b;
    }
}
