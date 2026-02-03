// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineArrayIndexAccessInts {
    function f() public pure returns (uint256) {
        return ([uint256(1), 2, 3, 4][2]);
    }
}
