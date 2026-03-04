// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmitThreeIdenticalEvents {
    event Terminated();

    function terminate() external {
        emit Terminated();
        emit Terminated();
        emit Terminated();
    }
}
