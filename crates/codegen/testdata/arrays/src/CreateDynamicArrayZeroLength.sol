// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateDynamicArrayZeroLength {
    function f() public pure returns (uint256) {
        uint256[][] memory a = new uint256[][](0);
        return a.length + 7;
    }
}
