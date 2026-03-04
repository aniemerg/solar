// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface I {
    event Event(address indexed _from, uint256 _value);
}

contract EventEmitViaInterface {
    function emitEvent(uint256 _value) public {
        emit I.Event(msg.sender, _value);
    }
}
