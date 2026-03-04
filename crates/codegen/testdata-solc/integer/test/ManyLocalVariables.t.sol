// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ManyLocalVariables.sol";

contract ManyLocalVariablesTest {
    function test_ManyLocalVariables() public {
        ManyLocalVariables c = new ManyLocalVariables();
        // run(0x1000, 0x10000, 0x100000) -> 0x121121
        assert(c.run(0x1000, 0x10000, 0x100000) == 0x121121);
    }
}
