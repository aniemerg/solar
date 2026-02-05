// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventAnonymousWithTopics {
    event Deposit(address indexed _from, bytes32 indexed _id, uint256 indexed _value, uint256 indexed _value2, bytes32 data) anonymous;

    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value, 2, "abc");
    }
}
