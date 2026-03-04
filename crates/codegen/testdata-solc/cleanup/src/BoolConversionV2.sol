// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BoolConversionV2 {
    function f(bool _b) public pure returns (uint256) {
        if (_b) return 1;
        else return 0;
    }

    function g(bool _in) public pure returns (bool _out) {
        _out = _in;
    }
}
