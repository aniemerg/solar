// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockBasefee {
    function f() public view returns (uint) {
        return block.basefee;
    }
    function g() public view returns (uint ret) {
        assembly {
            ret := basefee()
        }
    }
}
