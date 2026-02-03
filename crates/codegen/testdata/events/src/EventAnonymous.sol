// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventAnonymous {
    event Deposit() anonymous;

    function deposit() public {
        emit Deposit();
    }
}
