// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryArraysIndexAccessWrite.sol";

contract MemoryArraysIndexAccessWriteTest {
    function test_MemoryArraysIndexAccessWrite() public {
        MemoryArraysIndexAccessWrite c = new MemoryArraysIndexAccessWrite();
        uint24[3][4] memory data = c.f();
        assert(data[2][2] == 1);
        assert(data[3][2] == 7);
    }
}
