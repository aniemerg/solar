// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructArrayMemberDynamic {
    struct S {
        uint32 a;
        uint256[] b;
        uint64 c;
    }

    function f(S calldata s)
        external
        pure
        returns (uint32 a, uint256 b0, uint256 b1, uint64 c)
    {
        a = s.a;
        b0 = s.b[0];
        b1 = s.b[1];
        c = s.c;
    }
}
