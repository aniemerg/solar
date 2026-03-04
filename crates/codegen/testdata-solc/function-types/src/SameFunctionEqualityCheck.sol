// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SameFunctionEqualityCheck {
    function(uint256) internal returns (uint256) x;

    constructor() {
        x = double;
    }

    function checkEquality() public returns (bool) {
        return x == double;
    }

    function double(uint256 _arg) public pure returns (uint256 _ret) {
        _ret = _arg * 2;
    }
}
