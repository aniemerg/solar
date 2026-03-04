// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CalldataDyn2dBytesToMemory.sol";

contract CalldataDyn2dBytesToMemoryTest {
    function test_CalldataDyn2dBytesToMemory() public {
        CalldataDyn2dBytesToMemory c = new CalldataDyn2dBytesToMemory();
        // f(bytes[]): 0x20, 2, 0x60, 0x60, 0x20, 2, "ab" -> 0x20, 2, 0x40, 0x80, 2, "ab", 2, "ab"
        bytes[] memory inp = new bytes[](2);
        inp[0] = "ab";
        inp[1] = "ab";
        bytes[] memory result = c.f(inp);
        assert(result.length == 2);
        assert(result[0].length == 2);
        assert(result[0][0] == bytes1("a"));
        assert(result[0][1] == bytes1("b"));
        assert(result[1].length == 2);
        assert(result[1][0] == bytes1("a"));
        assert(result[1][1] == bytes1("b"));
    }
}
