// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CalldataDynamicArrayToMemory.sol";

contract CalldataDynamicArrayToMemoryTest {
    function test_CalldataDynamicArrayToMemory() public {
        CalldataDynamicArrayToMemory c = new CalldataDynamicArrayToMemory();
        // f(uint256[][]): 0x20, 0x1, 0x20, 0x2, 0x17, 0x2a -> 0x1, 0x40, 0x2, 0x17, 0x2a
        uint256[][] memory inp = new uint256[][](1);
        inp[0] = new uint256[](2);
        inp[0][0] = 0x17;
        inp[0][1] = 0x2a;
        (uint256 len, uint256[] memory m) = c.f(inp);
        assert(len == 1);
        assert(m.length == 2);
        assert(m[0] == 0x17);
        assert(m[1] == 0x2a);
    }
}
