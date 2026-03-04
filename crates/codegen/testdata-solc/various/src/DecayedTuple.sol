// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecayedTuple {
    function f() public returns (uint256) {
        uint256 x = 1;
        (x) = 2;
        return x;
    }
}
