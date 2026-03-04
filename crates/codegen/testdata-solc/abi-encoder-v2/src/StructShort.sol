// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructShort {
    struct S { int a; uint b; bytes16 c; }
    function f(S memory s) public pure returns (S memory q) {
        q = s;
    }
}
