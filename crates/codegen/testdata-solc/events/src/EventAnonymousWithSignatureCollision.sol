// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventAnonymousWithSignatureCollision {
    event Deposit(uint256 indexed _from, bytes32 indexed _id, uint _value) anonymous;
    function deposit(bytes32 _id) public payable {
        emit Deposit(0x2012159ca6b6372f102c535a4814d13a00bfc5568ddfd72151364061b00355d1, _id, msg.value);
    }
}
