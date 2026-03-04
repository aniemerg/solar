// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TupleFromTernaryExpression {
    function f() public pure returns (bool) {
        bool flag;
        ((flag = true) ? (1, 2, 3) : (3, 2, 1));
        return flag;
    }
}
