// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalCall {
    function g(uint256 n) external pure returns (uint256) {
        return n + 1;
    }

    function f(uint256 n) public view returns (uint256) {
        return this.g(2 * n);
    }
}
