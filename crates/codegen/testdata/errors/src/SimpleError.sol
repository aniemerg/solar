// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error E(uint256 a, uint256 b);

contract SimpleError {
    function f() public pure {
        revert E(2, 7);
    }
}
