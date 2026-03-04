// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function balance() public returns (uint256) {
        return 1;
    }

    function transfer(uint256 amount) public returns (uint256) {
        return amount;
    }
}

contract D {
    function f() public returns (uint256) {
        return (new C{salt: hex"00"}()).balance();
    }

    function g() public returns (uint256) {
        return (new C{salt: hex"01"}()).transfer(5);
    }
}
