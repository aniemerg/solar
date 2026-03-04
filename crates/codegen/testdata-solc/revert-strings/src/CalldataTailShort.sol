// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataTailShort {
    function f(uint256[][] calldata x) external pure { x[0]; }
}
