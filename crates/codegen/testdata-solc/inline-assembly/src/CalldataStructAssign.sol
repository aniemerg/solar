// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

pragma abicoder v2;

contract CalldataStructAssign {
    struct S { uint256 x; }
    struct S2 { uint256 x; uint256 y; }
    function f(S calldata s, S2 calldata s2) public pure returns (uint256 r, uint256 r2) {
        assembly {
            s := s2
            s2 := 4
        }
        r = s.x;
        r2 = s2.x;
    }
}
