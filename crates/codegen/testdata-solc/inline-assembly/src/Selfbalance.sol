// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Selfbalance {
    function f() public payable returns (uint ret) {
        assembly {
            ret := selfbalance()
        }
    }
}
