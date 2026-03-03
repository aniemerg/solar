// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InternalFunctionPointer {
    function() internal view returns (uint256) immutable z;

    constructor() {
        z = f;
    }

    function f() public view returns (uint256) {
        return 7;
    }

    function callZ() public view returns (uint) {
        return z();
    }
}
