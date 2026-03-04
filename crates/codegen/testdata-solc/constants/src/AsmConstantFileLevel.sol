// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

address constant e = 0x1212121212121212121212121000002134593163;

contract AsmConstantFileLevel {
    function f() public pure returns (address z) {
        assembly { z := e }
    }
}
