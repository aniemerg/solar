// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorAssignmentExpression {
    bool public z;
    function f() public {
        ((z = true) ? this.f : this.f).selector;
    }
}
