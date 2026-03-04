// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CalldataNestedArrayCopyToMemory.sol";

contract CalldataNestedArrayCopyToMemoryTest {
    function test_CalldataNestedArrayCopyToMemory() public {
        CalldataNestedArrayCopyToMemory c = new CalldataNestedArrayCopyToMemory();
        // killer(uint256[][2]): 0x20, 0x40, 0x40, 2, 1, 2 -> 0x20, 0x20, 0x40, 0xa0, 2, 1, 2, 2, 1, 2
        // weapon = [[1, 2], [1, 2]]
        uint256[][2] memory weapon;
        weapon[0] = new uint256[](2);
        weapon[0][0] = 1;
        weapon[0][1] = 2;
        weapon[1] = new uint256[](2);
        weapon[1][0] = 1;
        weapon[1][1] = 2;
        CalldataNestedArrayCopyToMemory.shouldBug memory result = c.killer(weapon);
        assert(result.deadly[0].length == 2);
        assert(result.deadly[0][0] == 1);
        assert(result.deadly[0][1] == 2);
        assert(result.deadly[1].length == 2);
        assert(result.deadly[1][0] == 1);
        assert(result.deadly[1][1] == 2);
    }
}
