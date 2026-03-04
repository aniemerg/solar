// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayNestedCalldataToMemory.sol";

contract ArrayNestedCalldataToMemoryTest {
    function test_ArrayNestedCalldataToMemory() public {
        ArrayNestedCalldataToMemory c = new ArrayNestedCalldataToMemory();

        // test1(uint256[][]): 0x20, 2, 0x40, 0x40, 2, 23, 42 -> 2, 65
        // Two arrays: [[23, 42], [23, 42]]
        uint256[][] memory d1 = new uint256[][](2);
        d1[0] = new uint256[](2);
        d1[0][0] = 23; d1[0][1] = 42;
        d1[1] = new uint256[](2);
        d1[1][0] = 23; d1[1][1] = 42;
        (uint256 r1a, uint256 r1b) = c.run1(d1);
        assert(r1a == 2);
        assert(r1b == 65);

        // test2(uint256[][2]): 0x20, 0x40, 0x40, 2, 23, 42 -> 2, 65
        // [2][2] with same sub-array [23, 42]
        uint256[][2] memory d2;
        d2[0] = new uint256[](2);
        d2[0][0] = 23; d2[0][1] = 42;
        d2[1] = new uint256[](2);
        d2[1][0] = 23; d2[1][1] = 42;
        (uint256 r2a, uint256 r2b) = c.run2(d2);
        assert(r2a == 2);
        assert(r2b == 65);

        // test3(uint256[2][]): 0x20, 2, 23, 42, 23, 42 -> 2, 65
        uint256[2][] memory d3 = new uint256[2][](2);
        d3[0][0] = 23; d3[0][1] = 42;
        d3[1][0] = 23; d3[1][1] = 42;
        (uint256 r3a, uint256 r3b) = c.run3(d3);
        assert(r3a == 2);
        assert(r3b == 65);

        // test4(uint256[2][2]): 23, 42, 23, 42 -> 65
        uint256[2][2] memory d4;
        d4[0][0] = 23; d4[0][1] = 42;
        d4[1][0] = 23; d4[1][1] = 42;
        uint256 r4 = c.run4(d4);
        assert(r4 == 65);
    }
}
