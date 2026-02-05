// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShortDataCallsFallback {
    uint256 public x;

    // Signature is d88e0b00
    function fow() public { x = 3; }
    fallback() external { x = 2; }
}
