// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibStatic {
    function x() public view returns (uint256) {
        return 1;
    }
}

contract LibraryStaticcallDelegatecall {
    uint256 t;

    function f() public returns (uint256) {
        t = 2;
        return this.g();
    }

    function g() public view returns (uint256) {
        return LibStatic.x();
    }
}
