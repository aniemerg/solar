// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyBytesCopy.sol";

contract EmptyBytesCopyTest {
    function test_EmptyBytesCopy() public {
        EmptyBytesCopy c = new EmptyBytesCopy();
        // fromMemory() -> 0x00
        assert(c.fromMemory() == 0x00);
        // fromCalldata(bytes): 0x40, 0x60, 0x00, 0xffffffff... -> 0x00
        bytes memory inp = new bytes(0);
        assert(c.fromCalldata(inp) == 0x00);
        // fromStorage() -> 0x00
        assert(c.fromStorage() == 0x00);
    }
}
