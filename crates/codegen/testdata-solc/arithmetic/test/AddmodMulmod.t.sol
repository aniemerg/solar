// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AddmodMulmod.sol";

contract AddmodMulmodTest {
    AddmodMulmod c;

    function setUp() public {
        c = new AddmodMulmod();
    }

    function test_AddmodMulmod() public view {
        assert(c.run() == 0);
    }
}
