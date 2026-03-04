// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// this test just checks that the copy loop does not mess up the stack
contract StoreBytes {
    function save() public returns (uint256 r) {
        r = 23;
        savedData = msg.data;
        r = 24;
    }

    bytes savedData;
}
