// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventReallyLotsOfData {
    event Deposit(uint fixeda, bytes dynx, uint fixedb);
    function deposit() public {
        emit Deposit(10, msg.data, 15);
    }
}
