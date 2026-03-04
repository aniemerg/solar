// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ManySubassemblies.sol";

contract ManySubassembliesTest {
    ManySubassemblies c;

    function setUp() public {
        c = new ManySubassemblies();
    }

    function test_run() public {
        c.run();
    }
}
