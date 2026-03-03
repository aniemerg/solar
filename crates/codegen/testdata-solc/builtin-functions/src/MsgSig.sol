// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgSig {
    function foo(uint256) public pure returns (bytes4 value) {
        return msg.sig;
    }
}
