// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalWithArguments {
    function g(int256 x, int256 y) public pure returns (int256) { return x - y; }
    function h(int256 y, int256 x) public pure returns (int256) { return y - x; }

    function f() public pure returns (int256) {
        return (false ? g : h)(2, 1);
    }
}
