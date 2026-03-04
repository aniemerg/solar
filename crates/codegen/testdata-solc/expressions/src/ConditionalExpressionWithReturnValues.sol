// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalExpressionWithReturnValues {
    function f(bool cond, uint v) public pure returns (uint a, uint b) {
        cond ? a = v : b = v;
    }
}
