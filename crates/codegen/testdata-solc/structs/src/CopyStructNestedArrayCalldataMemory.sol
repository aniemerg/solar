// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyStructNestedArrayCalldataMemory {
    struct S {
        uint8[1] x;
        uint8[] y;
    }

    function test(S calldata s) public pure returns (S memory) {
        return s;
    }
}
