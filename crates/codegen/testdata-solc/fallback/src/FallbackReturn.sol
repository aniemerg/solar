// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackReturn {
    uint256 public x;

    fallback() external {
        if (x == 2) return;
        x++;
    }
}
