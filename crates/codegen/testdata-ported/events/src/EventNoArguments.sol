// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventNoArguments {
    event E();

    function emitEvent() public {
        emit E();
    }
}
