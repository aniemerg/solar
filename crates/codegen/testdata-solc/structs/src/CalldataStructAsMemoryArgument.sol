// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructAsMemoryArgument {
    struct S {
        uint128 p1;
        uint256[][2] a;
        uint32 p2;
    }

    function g(uint32 p1, S memory s) internal pure returns (uint32, uint128, uint256, uint256, uint32) {
        s.p1++;
        s.a[0][1]++;
        return (p1, s.p1, s.a[0][0], s.a[1][1], s.p2);
    }

    function f(uint32 p1, S calldata c) external pure returns (uint32, uint128, uint256, uint256, uint32) {
        return g(p1, c);
    }
}
