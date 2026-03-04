// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct GlobalS {
    uint256 a;
    uint256 b;
}

contract Global {
    function f(GlobalS calldata s) external pure returns (uint256, uint256) {
        return (s.a, s.b);
    }
}
