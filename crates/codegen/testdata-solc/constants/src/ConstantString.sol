// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstantString {
    bytes constant a = "\x03\x01\x02";
    bytes constant b = hex"030102";
    string constant c = "hello";

    function f() public pure returns (bytes memory) {
        return a;
    }

    function g() public pure returns (bytes memory) {
        return b;
    }

    function h() public pure returns (bytes memory) {
        return bytes(c);
    }
}
