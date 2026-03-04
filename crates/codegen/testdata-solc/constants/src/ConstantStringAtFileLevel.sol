// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

bytes constant a = "\x03\x01\x02";
bytes constant b = hex"030102";
string constant c = "hello";
uint256 constant x = 56;
enum ActionChoices {GoLeft, GoRight, GoStraight, Sit}
ActionChoices constant choices = ActionChoices.GoRight;
bytes32 constant st = "abc\x00\xff__";

contract ConstantStringAtFileLevel {
    function f() public pure returns (bytes memory) {
        return a;
    }

    function g() public pure returns (bytes memory) {
        return b;
    }

    function h() public pure returns (bytes memory) {
        return bytes(c);
    }

    function i() public pure returns (uint, ActionChoices, bytes32) {
        return (x, choices, st);
    }
}
