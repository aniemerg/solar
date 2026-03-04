// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstantVariables {
    uint256 constant x = 56;
    enum ActionChoices {GoLeft, GoRight, GoStraight, Sit}
    ActionChoices constant choices = ActionChoices.GoLeft;
    bytes32 constant st = "abc\x00\xff__";
}
