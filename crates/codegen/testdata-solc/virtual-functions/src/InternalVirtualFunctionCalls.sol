// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    function f() public returns (uint256 i) {
        return g();
    }

    function g() internal virtual returns (uint256 i) {
        return 1;
    }
}

contract Derived is Base {
    function g() internal override returns (uint256 i) {
        return 2;
    }
}
