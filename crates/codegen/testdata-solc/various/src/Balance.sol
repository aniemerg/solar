// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Balance {
    constructor() payable {}

    function getBalance() public returns (uint256 balance) {
        return address(this).balance;
    }
}
