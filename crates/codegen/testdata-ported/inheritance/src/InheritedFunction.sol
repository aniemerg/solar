// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() internal virtual returns (uint256) {
        return 1;
    }
}

contract B is A {
    function f() internal override returns (uint256) {
        return 2;
    }

    function g() public returns (uint256) {
        return A.f();
    }
}
