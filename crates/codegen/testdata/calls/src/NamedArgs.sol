// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NamedArgs {
    function a(uint256 a, uint256 b, uint256 c) public pure returns (uint256 r) {
        r = a * 100 + b * 10 + c * 1;
    }

    function b() public pure returns (uint256 r) {
        r = a({a: 1, b: 2, c: 3});
    }

    function c() public pure returns (uint256 r) {
        r = a({b: 2, c: 3, a: 1});
    }
}
