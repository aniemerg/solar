// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract Basic {
    function d() public {}

    function e() public payable returns (uint) {
        return msg.value;
    }

    function f(uint a) public pure returns (uint, uint) {
        return (a, a);
    }

    function g() public pure returns (uint, uint) {
        return (2, 3);
    }

    function h(uint x, uint y) public pure returns (uint) {
        unchecked { return x - y; }
    }

    function i(bool b) public pure returns (bool) {
        return !b;
    }

    function j(bytes32 b) public pure returns (bytes32, bytes32) {
        return (b, b);
    }

    function k() public pure returns (uint) {
        return msg.data.length;
    }

    function l(uint a) public pure returns (uint d) {
        return a * 7;
    }
}
