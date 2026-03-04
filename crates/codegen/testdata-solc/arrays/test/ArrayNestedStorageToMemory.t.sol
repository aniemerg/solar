// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayNestedStorageToMemory.sol";

contract ArrayNestedStorageToMemoryTest {
    function test_ArrayNestedStorageToMemory() public {
        ArrayNestedStorageToMemory c = new ArrayNestedStorageToMemory();

        // test1() -> 0x20, 2, 0x40, 0xa0, 2, 1, 2, 3, 3, 4, 5
        uint256[][] memory r1 = c.run1();
        assert(r1.length == 2);
        assert(r1[0].length == 2);
        assert(r1[0][0] == 1);
        assert(r1[0][1] == 2);
        assert(r1[1].length == 3);
        assert(r1[1][0] == 3);
        assert(r1[1][1] == 4);
        assert(r1[1][2] == 5);

        // test2() -> 0x20, 0x40, 0xc0, 3, 6, 7, 8, 1, 9
        uint256[][2] memory r2 = c.run2();
        assert(r2[0].length == 3);
        assert(r2[0][0] == 6);
        assert(r2[0][1] == 7);
        assert(r2[0][2] == 8);
        assert(r2[1].length == 1);
        assert(r2[1][0] == 9);

        // test3() -> 0x20, 3, 1, 2, 3, 4, 5, 6
        uint256[2][] memory r3 = c.run3();
        assert(r3.length == 3);
        assert(r3[0][0] == 1);
        assert(r3[0][1] == 2);
        assert(r3[1][0] == 3);
        assert(r3[1][1] == 4);
        assert(r3[2][0] == 5);
        assert(r3[2][1] == 6);

        // test4() -> 10, 11, 12, 13
        uint256[2][2] memory r4 = c.run4();
        assert(r4[0][0] == 10);
        assert(r4[0][1] == 11);
        assert(r4[1][0] == 12);
        assert(r4[1][1] == 13);
    }
}
