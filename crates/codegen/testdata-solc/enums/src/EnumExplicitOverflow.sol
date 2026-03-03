// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumExplicitOverflow {
    enum ActionChoices { GoLeft, GoRight, GoStraight }

    ActionChoices choice;

    function getChoiceExp(uint256 x) public returns (uint256 d) {
        choice = ActionChoices(x);
        d = uint256(choice);
    }

    function getChoiceFromSigned(int256 x) public returns (uint256 d) {
        choice = ActionChoices(x);
        d = uint256(choice);
    }

    function getChoiceFromMax() public returns (uint256 d) {
        choice = ActionChoices(type(uint).max);
        d = uint256(choice);
    }
}
