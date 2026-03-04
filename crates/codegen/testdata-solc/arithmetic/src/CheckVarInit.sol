// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    uint public x = msg.value - 10;
    constructor() payable {}
}

contract CheckVarInit {
    function f() public {
        unchecked {
            new C();
        }
    }
    function g() public payable returns (uint) {
        return (new C{value: 11}()).x();
    }
}
