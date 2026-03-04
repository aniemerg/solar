// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataDynamicNested {
    struct S2 {
        uint256 b;
    }
    struct S {
        uint256 a;
        S2[] children;
    }

    function f(S calldata s) external pure returns (uint256, uint256, uint256, uint256) {
        return (s.children.length, s.a, s.children[0].b, s.children[1].b);
    }
}
