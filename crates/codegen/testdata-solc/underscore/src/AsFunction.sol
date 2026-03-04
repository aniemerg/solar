// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AsFunction {
    function _() public pure returns (uint) {
        return 88;
    }

    function g() public pure returns (uint) {
        return _();
    }

    function h() public pure returns (uint) {
        _;
        return 33;
    }
}
