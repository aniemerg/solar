// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D { constructor() payable {} }

contract FailedCreate {
    uint public x;
    constructor() payable {}

    function f(uint amount) public {
        x++;
        (new D){value: amount, salt: bytes32(x)}();
    }

    function stack(uint depth) public payable {
        if (depth > 0)
            this.stack(depth - 1);
        else
            f(0);
    }
}
