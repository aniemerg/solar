// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D {
    event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value);
    }
}
contract EventEmitFromOtherContract {
    D d;
    constructor() {
        d = new D();
    }
    function deposit(bytes32 _id) public payable {
        d.deposit{value: msg.value}(_id);
    }
}
