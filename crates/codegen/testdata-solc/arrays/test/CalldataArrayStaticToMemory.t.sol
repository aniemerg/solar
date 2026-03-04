// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayStaticToMemory.sol";

contract CalldataArrayStaticToMemoryTest {
    function test_CalldataArrayStaticToMemory() public {
        CalldataArrayStaticToMemory c = new CalldataArrayStaticToMemory();
        // f(uint256[2]): 43, 57 -> 43, 57
        uint256[2] memory inp = [uint256(43), 57];
        (uint256 a, uint256 b) = c.f(inp);
        assert(a == 43);
        assert(b == 57);
    }
}
