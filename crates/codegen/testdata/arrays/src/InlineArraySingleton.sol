// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineArraySingleton {
    function f() public pure returns (uint256) {
        return [uint256(4)][0];
    }
}
