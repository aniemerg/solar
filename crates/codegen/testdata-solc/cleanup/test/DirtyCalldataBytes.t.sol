// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DirtyCalldataBytes.sol";

contract DirtyCalldataBytesTest {
    function test_DirtyCalldataBytes() public {
        DirtyCalldataBytes c = new DirtyCalldataBytes();
        // Pass bytes "dead" (4 bytes: 0x64, 0x65, 0x61, 0x64)
        // b[3] = 0x64 ('d'), check that it's properly left-aligned as bytes1
        bytes memory input = "dead";
        assert(c.f(input));
    }
}
