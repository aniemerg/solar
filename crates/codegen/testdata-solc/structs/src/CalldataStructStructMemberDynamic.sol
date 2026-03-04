// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructStructMemberDynamic {
    struct S {
        uint64 a;
        bytes b;
    }
    struct S1 {
        uint256 a;
        S s;
        uint256 c;
    }

    function f(S1 calldata s1)
        external
        pure
        returns (uint256 a, uint64 b0, bytes1 b1, uint256 c)
    {
        a = s1.a;
        b0 = s1.s.a;
        b1 = s1.s.b[0];
        c = s1.c;
    }
}
