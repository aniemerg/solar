// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyRevert {
    function f() public {
        revert("");
    }
    function g(string calldata msg_) public {
        revert(msg_);
    }
}
