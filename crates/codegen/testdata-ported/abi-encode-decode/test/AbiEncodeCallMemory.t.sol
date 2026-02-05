// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeCallMemory.sol";

contract AbiEncodeCallMemoryTest {
    AbiEncodeCallMemory c;

    function setUp() public {
        c = new AbiEncodeCallMemory();
    }

    function test_AbiEncodeCallMemory() public {
        bytes4 sel = c.test();
        assert(sel == AbiEncodeCallMemory.something.selector);
    }
}
