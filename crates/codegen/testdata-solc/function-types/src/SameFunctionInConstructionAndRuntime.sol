// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SameFunctionInConstructionAndRuntime {
    uint256 public initial;

    constructor() {
        initial = double(2);
    }

    function double(uint256 _arg) public pure returns (uint256 _ret) {
        _ret = _arg * 2;
    }

    function runtime(uint256 _arg) public pure returns (uint256) {
        return double(_arg);
    }
}
