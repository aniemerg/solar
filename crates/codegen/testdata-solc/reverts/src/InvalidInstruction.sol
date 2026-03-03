// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidInstruction {
    function f() public {
        assembly {
            invalid()
        }
    }
}
