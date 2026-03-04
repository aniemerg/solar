// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockGaslimit {
    function f() public view returns (uint) {
        return block.gaslimit;
    }
}
