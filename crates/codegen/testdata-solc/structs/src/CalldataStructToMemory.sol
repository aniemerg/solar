// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructToMemory {
    struct S {
        uint256 a;
        uint256 b;
        bytes2 c;
    }

    function f(S calldata s) external pure returns (uint256, uint256, bytes1) {
        S memory m = s;
        return (m.a, m.b, m.c[1]);
    }
}
