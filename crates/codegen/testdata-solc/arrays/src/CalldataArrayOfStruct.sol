// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayOfStruct {
    struct S {
        uint256 a;
        uint256 b;
    }

    function f(S[] calldata s)
        external
        pure
        returns (uint256 l, uint256 a, uint256 b, uint256 cc, uint256 d)
    {
        l = s.length;
        a = s[0].a;
        b = s[0].b;
        cc = s[1].a;
        d = s[1].b;
    }
}
