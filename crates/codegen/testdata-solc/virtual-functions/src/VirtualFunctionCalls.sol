// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    function f() public returns (uint256 i) {
        return g();
    }

    function g() public virtual returns (uint256 i) {
        return 1;
    }
}

contract VirtualFunctionCalls is Base {
    function g() public override returns (uint256 i) {
        return 2;
    }
}
