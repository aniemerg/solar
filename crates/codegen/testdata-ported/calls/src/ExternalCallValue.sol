// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalCallValue {
    function g(uint256 n) external payable returns (uint256, uint256) {
        return (msg.value * 1000, n);
    }

    function f(uint256 n) public payable returns (uint256, uint256) {
        return this.g{value: 10}(n);
    }
}
