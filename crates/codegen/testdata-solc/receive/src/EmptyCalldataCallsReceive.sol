// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyCalldataCallsReceive {
    uint256 public x;

    receive() external payable {
        ++x;
    }
}
