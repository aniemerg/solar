// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgSigInternal {
    function boo() public pure returns (bytes4 value) {
        return msg.sig;
    }

    function foo(uint256) public pure returns (bytes4 value) {
        return boo();
    }
}
