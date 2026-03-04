// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Codehash {
    function f() public returns (bytes32) {
        // non-existent in tests
        return address(0).codehash;
    }

    function g() public returns (bytes32) {
        // precompile
        return address(0x1).codehash;
    }

    function h() public returns (bool) {
        return address(this).codehash != 0;
    }
}
