// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalExpressionTuples {
    function f(bool cond) public pure returns (uint, uint) {
        return cond ? (1, 2) : (3, 4);
    }
}
