// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UsingEnums {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    ActionChoices choices;

    constructor() {
        choices = ActionChoices.GoStraight;
    }

    function getChoice() public view returns (uint256) {
        return uint256(choices);
    }
}
