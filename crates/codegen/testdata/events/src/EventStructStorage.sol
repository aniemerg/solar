// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventStructStorage {
    struct S {
        uint256 a;
    }

    event E(S);
    S s;

    function createEvent(uint256 x) public {
        s.a = x;
        emit E(s);
    }
}
