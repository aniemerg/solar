// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/Calldata2dBytesToMemory.sol";

contract Calldata2dBytesToMemoryTest {
    function test_Calldata2dBytesToMemory() public {
        Calldata2dBytesToMemory c = new Calldata2dBytesToMemory();
        // f(bytes[2]): 0x20, 0x40, 0x40, 2, "ab" -> 0x20, 2, "ab"
        bytes[2] memory inp;
        inp[0] = "ab";
        inp[1] = "ab";
        bytes memory result = c.f(inp);
        assert(result.length == 2);
        assert(result[0] == bytes1("a"));
        assert(result[1] == bytes1("b"));
    }
}
