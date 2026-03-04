// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventReallyLotsOfDataFromStorage {
    bytes x;
    event Deposit(uint fixeda, bytes dynx, uint fixedb);
    function deposit() public {
        x.push("A");
        x.push("B");
        x.push("C");
        emit Deposit(10, x, 15);
    }
}
