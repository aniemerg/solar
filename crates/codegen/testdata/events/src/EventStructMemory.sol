// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventStructMemory {
    struct S {
        uint256 a;
    }

    event E(S);

    function createEvent(uint256 x) public {
        emit E(S(x));
    }
}
