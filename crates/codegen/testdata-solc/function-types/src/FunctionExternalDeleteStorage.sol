// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionExternalDeleteStorage {
    function() external public x;

    function f() public {}

    function set() external {
        x = this.f;
    }

    function isF() external view returns (bool) {
        return x == this.f;
    }

    function isZero() external view returns (bool) {
        function() external zero;
        return x == zero;
    }

    function deleteFunction() public {
        delete x;
    }
}
