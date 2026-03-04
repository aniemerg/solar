// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/NestedArrayOfStructsWithNestedArrayFromStorageToMemory.sol";

contract NestedArrayOfStructsWithNestedArrayFromStorageToMemoryTest {
    function test_NestedArrayOfStructsWithNestedArrayFromStorageToMemory() public {
        NestedArrayOfStructsWithNestedArrayFromStorageToMemory c = new NestedArrayOfStructsWithNestedArrayFromStorageToMemory();

        // test1() -> 0x20, 2, 0x40, 0x0100, 0x60, 7, 11, 2, 23, 29, 0x60, 17, 19, 1, 31
        NestedArrayOfStructsWithNestedArrayFromStorageToMemory.S[] memory r1 = c.run1();
        assert(r1.length == 2);
        assert(r1[0].b[0] == 7); assert(r1[0].b[1] == 11);
        assert(r1[0].a.length == 2); assert(r1[0].a[0] == 23); assert(r1[0].a[1] == 29);
        assert(r1[1].b[0] == 17); assert(r1[1].b[1] == 19);
        assert(r1[1].a.length == 1); assert(r1[1].a[0] == 31);

        // test2() -> 0x20, 0x20, 0x60, 43, 47, 0
        NestedArrayOfStructsWithNestedArrayFromStorageToMemory.S[1] memory r2 = c.run2();
        assert(r2[0].b[0] == 43); assert(r2[0].b[1] == 47);
        assert(r2[0].a.length == 0);
    }
}
