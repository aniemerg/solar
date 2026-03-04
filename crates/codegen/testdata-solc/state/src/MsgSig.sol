// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgSig {
    function f() public view returns (bytes4) {
        return msg.sig;
    }
    function g() public view returns (bytes4) {
        return msg.sig;
    }
}
