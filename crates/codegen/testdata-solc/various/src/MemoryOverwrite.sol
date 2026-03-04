// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryOverwrite {
    function f() public returns (bytes memory x) {
        x = "12345";
        x[3] = 0x61;
        x[0] = 0x62;
    }
}
