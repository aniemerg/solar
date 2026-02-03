// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleThrow {
    function f(uint256 x) public pure returns (uint256) {
        if (x > 10) return x + 10;
        revert();
    }
}
