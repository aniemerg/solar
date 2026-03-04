// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/NestedArrayOfStructsCalldataToMemory.sol";

contract NestedArrayOfStructsCalldataToMemoryTest {
    function test_NestedArrayOfStructsCalldataToMemory() public {
        NestedArrayOfStructsCalldataToMemory c = new NestedArrayOfStructsCalldataToMemory();

        // test1((uint8,uint8)[1][2]): 1, 2, 3, 4 -> 1, 2, 3, 4
        NestedArrayOfStructsCalldataToMemory.S[1][2] memory a1;
        a1[0][0] = NestedArrayOfStructsCalldataToMemory.S(1, 2);
        a1[1][0] = NestedArrayOfStructsCalldataToMemory.S(3, 4);
        NestedArrayOfStructsCalldataToMemory.S[1][2] memory r1 = c.run1(a1);
        assert(r1[0][0].x == 1); assert(r1[0][0].y == 2);
        assert(r1[1][0].x == 3); assert(r1[1][0].y == 4);

        // test2((uint8,uint8)[1][]): 0x20, 3, 7, 11, 13, 17, 19, 23 -> same
        NestedArrayOfStructsCalldataToMemory.S[1][] memory a2 = new NestedArrayOfStructsCalldataToMemory.S[1][](3);
        a2[0][0] = NestedArrayOfStructsCalldataToMemory.S(7, 11);
        a2[1][0] = NestedArrayOfStructsCalldataToMemory.S(13, 17);
        a2[2][0] = NestedArrayOfStructsCalldataToMemory.S(19, 23);
        NestedArrayOfStructsCalldataToMemory.S[1][] memory r2 = c.run2(a2);
        assert(r2.length == 3);
        assert(r2[0][0].x == 7); assert(r2[0][0].y == 11);

        // test3((uint8,uint8)[][2]): 0x20, 0x40, 0xa0, 1, 3, 7, 2, 11, 13, 17, 19 -> same
        NestedArrayOfStructsCalldataToMemory.S[][2] memory a3;
        a3[0] = new NestedArrayOfStructsCalldataToMemory.S[](1);
        a3[0][0] = NestedArrayOfStructsCalldataToMemory.S(3, 7);
        a3[1] = new NestedArrayOfStructsCalldataToMemory.S[](2);
        a3[1][0] = NestedArrayOfStructsCalldataToMemory.S(11, 13);
        a3[1][1] = NestedArrayOfStructsCalldataToMemory.S(17, 19);
        NestedArrayOfStructsCalldataToMemory.S[][2] memory r3 = c.run3(a3);
        assert(r3[0].length == 1); assert(r3[0][0].x == 3);
        assert(r3[1].length == 2); assert(r3[1][0].x == 11);
    }
}
