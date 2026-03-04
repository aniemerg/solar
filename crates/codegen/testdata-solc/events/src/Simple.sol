// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    event E();
}

contract Simple is C {
    event E(uint256, uint256);
    function f() public {
        emit C.E();
        emit E(1, 2);
    }
}
