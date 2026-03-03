// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataBytesToMemory.sol";

contract CalldataBytesToMemoryTest {
    function test_CalldataBytesToMemory() public {
        CalldataBytesToMemory c = new CalldataBytesToMemory();
        bytes memory input = "abcdefgh";
        assert(
            c.f(input) ==
                0x48624fa43c68d5c552855a4e2919e74645f683f5384f72b5b051b71ea41d4f2d
        );
    }
}
