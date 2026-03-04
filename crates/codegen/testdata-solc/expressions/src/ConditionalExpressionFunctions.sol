// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalExpressionFunctions {
    function x() public pure returns (uint) { return 1; }
    function y() public pure returns (uint) { return 2; }

    function f(bool cond) public view returns (uint) {
        function () external pure returns (uint) z = cond ? this.x : this.y;
        return z();
    }
}
