// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct SInternal {
    uint256 x;
    uint256 y;
}

contract CalldataStructInternal {
    function f(SInternal calldata s) internal pure returns (uint256, uint256) {
        return (s.x, s.y);
    }

    function f(uint256, SInternal calldata s, uint256) external pure returns (uint256, uint256) {
        return f(s);
    }
}
