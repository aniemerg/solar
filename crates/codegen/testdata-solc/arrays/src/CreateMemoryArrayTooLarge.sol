// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateMemoryArrayTooLarge {
    function f() public returns (uint256) {
        uint256 l = 2**256 / 32;
        uint256[] memory x = new uint256[](l);
        uint256[] memory y = new uint256[](1);
        x[1] = 42;
        y[0] = 23;
        return x[1];
    }
    function g() public returns (uint256) {
        uint256 l = 2**256 / 2 + 1;
        uint16[] memory x = new uint16[](l);
        uint16[] memory y = new uint16[](1);
        x[2] = 42;
        y[0] = 23;
        return x[2];
    }
}
