// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionDeleteStorage {
    function a() public pure returns (uint256) {
        return 7;
    }

    function() internal pure returns (uint256) y;

    function set() public returns (uint256) {
        y = a;
        return y();
    }

    function d() public returns (uint256) {
        delete y;
        return 1;
    }

    function ca() public view returns (uint256) {
        return y();
    }
}
