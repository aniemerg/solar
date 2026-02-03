// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackOrReceive {
    uint256 x;
    uint256 y;

    fallback() external payable { ++x; }
    receive() external payable { ++y; }

    function f() external view returns (uint256, uint256) { return (x, y); }
}
