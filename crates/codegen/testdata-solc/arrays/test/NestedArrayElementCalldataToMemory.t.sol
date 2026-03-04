// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/NestedArrayElementCalldataToMemory.sol";

contract NestedArrayElementCalldataToMemoryTest {
    function test_NestedArrayElementCalldataToMemory() public {
        NestedArrayElementCalldataToMemory c = new NestedArrayElementCalldataToMemory();

        // test1(uint8[][][]): 2 outer elements, second has 2 inner, [7] and [8,9]
        uint8[][][] memory d1 = new uint8[][][](2);
        d1[0] = new uint8[][](0);
        d1[1] = new uint8[][](2);
        d1[1][0] = new uint8[](1); d1[1][0][0] = 7;
        d1[1][1] = new uint8[](2); d1[1][1][0] = 8; d1[1][1][1] = 9;
        uint8[][] memory r1 = c.run1(d1);
        assert(r1.length == 2);
        assert(r1[0][0] == 7);
        assert(r1[1][0] == 8);
        assert(r1[1][1] == 9);

        // test2(uint8[][1][]): 0x20, 2, ...
        uint8[][1][] memory d2 = new uint8[][1][](2);
        d2[0][0] = new uint8[](3); d2[0][0][0]=12; d2[0][0][1]=13; d2[0][0][2]=14;
        d2[1][0] = new uint8[](3); d2[1][0][0]=15; d2[1][0][1]=16; d2[1][0][2]=17;
        uint8[][1] memory r2 = c.run2(d2);
        assert(r2[0].length == 3);
        assert(r2[0][0] == 12);

        // test3(uint8[2][][2]): 2 outer (static), first has [7,7], second [8,8],[9,9]...
        uint8[2][][2] memory d3;
        d3[0] = new uint8[2][](1); d3[0][0] = [uint8(7), 7];
        d3[1] = new uint8[2][](2); d3[1][0] = [uint8(8), 8]; d3[1][1] = [uint8(9), 9];
        uint8[2][] memory r3 = c.run3(d3);
        assert(r3.length == 1);
        assert(r3[0][0] == 7);

        // test4(uint16[][]): [[7], [8, 9]]
        uint16[][] memory d4 = new uint16[][](2);
        d4[0] = new uint16[](1); d4[0][0] = 7;
        d4[1] = new uint16[](2); d4[1][0] = 8; d4[1][1] = 9;
        uint16[][] memory r4 = c.run4(d4);
        assert(r4.length == 2);
        assert(r4[0][0] == 7);

        // test5(uint32[][2]): [[7], [8,9]]
        uint32[][2] memory d5;
        d5[0] = new uint32[](1); d5[0][0] = 7;
        d5[1] = new uint32[](2); d5[1][0] = 8; d5[1][1] = 9;
        uint32[][2] memory r5 = c.run5(d5);
        assert(r5[0].length == 1);
        assert(r5[0][0] == 7);

        // test6(uint32[2][]): [[5,6],[7,8]]
        uint32[2][] memory d6 = new uint32[2][](2);
        d6[0] = [uint32(5), 6];
        d6[1] = [uint32(7), 8];
        uint32[2][] memory r6 = c.run6(d6);
        assert(r6.length == 2);
        assert(r6[0][0] == 5);
    }
}
