// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStructAllocation {
    struct S { uint256 a; }

    function f() external pure returns (uint256) {
        S memory s = S(1);
        return s.a;
    }
}
