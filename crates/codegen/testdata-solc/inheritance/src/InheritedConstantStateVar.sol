// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint256 constant x = 7;
}

contract B is A {
    function f() public returns (uint256) {
        return A.x;
    }
}
