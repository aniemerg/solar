// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Sending zero ether to a contract should still invoke the receive ether function
// (it previously did not because the gas stipend was not provided by the EVM)

contract Receiver {
    receive() external payable {}
}

contract SendZeroEther {
    constructor() payable {}

    function s() public returns (bool) {
        Receiver r = new Receiver();
        return payable(r).send(0);
    }
}
