// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/NestedArrayElementStorageToMemory.sol";

contract NestedArrayElementStorageToMemoryTest {
    function test_NestedArrayElementStorageToMemory() public {
        NestedArrayElementStorageToMemory c = new NestedArrayElementStorageToMemory();

        // test1() -> 0x20, 2, 0x40, 0xa0, 2, 3, 4, 2, 5, 6
        uint8[][] memory r1 = c.run1();
        assert(r1.length == 2);
        assert(r1[0][0] == 3); assert(r1[0][1] == 4);
        assert(r1[1][0] == 5); assert(r1[1][1] == 6);

        // test2() -> 0x20, 2, 0x40, 0xa0, 2, 6, 7, 2, 8, 9
        uint8[][] memory r2 = c.run2();
        assert(r2.length == 2);
        assert(r2[0][0] == 6); assert(r2[0][1] == 7);
        assert(r2[1][0] == 8); assert(r2[1][1] == 9);

        // test3() -> 0x20, 0x40, 0xa0, 2, 3, 4, 2, 5, 6
        uint8[][2] memory r3 = c.run3();
        assert(r3[0].length == 2); assert(r3[0][0] == 3); assert(r3[0][1] == 4);
        assert(r3[1].length == 2); assert(r3[1][0] == 5); assert(r3[1][1] == 6);

        // test4() -> 0x20, 1, 19, 31
        uint8[2][] memory r4 = c.run4();
        assert(r4.length == 1);
        assert(r4[0][0] == 19); assert(r4[0][1] == 31);

        // test5() -> 0x20, 3, 0x60, 0x80, 0x01a0, 0, 2, ...
        uint8[][][] memory r5 = c.run5();
        assert(r5.length == 3);
        assert(r5[1].length == 2);
        assert(r5[1][0][0] == 3);

        // test6()
        uint8[][2][] memory r6 = c.run6();
        assert(r6.length == 2);
        assert(r6[0][0].length == 2);
        assert(r6[0][0][0] == 3);

        // test7()
        uint8[2][][] memory r7 = c.run7();
        assert(r7.length == 1);
        assert(r7[0].length == 1);
        assert(r7[0][0][0] == 17);
        assert(r7[0][0][1] == 23);
    }
}
