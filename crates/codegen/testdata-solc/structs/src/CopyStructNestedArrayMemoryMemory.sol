// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyStructNestedArrayMemoryMemory {
    struct S {
        uint8[1] x;
        uint8[] y;
    }

    function test(S memory s) public pure returns (S memory r) {
        return r;
    }
}
