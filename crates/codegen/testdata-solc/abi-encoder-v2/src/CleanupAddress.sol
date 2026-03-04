// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupAddress {
    function g(address x) external pure returns (uint256 r) {
        assembly { r := x }
    }
    function f(uint256 a) external view returns (uint256) {
        address x;
        assembly { x := a }
        return this.g(x);
    }
}
