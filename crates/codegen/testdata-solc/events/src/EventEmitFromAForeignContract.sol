// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    event E();
}

contract D {
    function test() public {
        emit C.E();
    }
}
