// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmitTwoIdenticalEvents {
    event Terminated();

    function terminate() external {
        emit Terminated();
        emit Terminated();
    }
}
