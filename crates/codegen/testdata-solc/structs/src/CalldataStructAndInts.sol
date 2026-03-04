// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructAndInts {
    struct S {
        uint256 a;
        uint256 b;
    }

    function f(uint256 a, S calldata s, uint256 b)
        external
        pure
        returns (uint256, uint256, uint256, uint256)
    {
        return (a, s.a, s.b, b);
    }
}
