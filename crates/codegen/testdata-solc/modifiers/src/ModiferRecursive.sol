// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModiferRecursive {
    uint public called;
    modifier mod1 {
        called++;
        _;
    }
    function f(uint x) public mod1 returns (uint256 r) {
        return x == 0 ? 2 : f(x - 1)**2;
    }
}
