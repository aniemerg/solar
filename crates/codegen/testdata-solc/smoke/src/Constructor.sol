// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor {
    uint public state = 0;

    constructor(uint _state) payable {
        state = _state;
    }

    function balance() public payable returns (uint256) {
        return address(this).balance;
    }

    function update(uint _state) public {
        state = _state;
    }
}
