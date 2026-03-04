// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Chainid {
    function f() public returns (uint id) {
        assembly {
            id := chainid()
        }
    }
}
