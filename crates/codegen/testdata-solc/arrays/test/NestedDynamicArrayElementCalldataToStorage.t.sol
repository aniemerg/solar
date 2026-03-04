// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/NestedDynamicArrayElementCalldataToStorage.sol";

contract NestedDynamicArrayElementCalldataToStorageTest {
    function test_NestedDynamicArrayElementCalldataToStorage() public {
        NestedDynamicArrayElementCalldataToStorage c = new NestedDynamicArrayElementCalldataToStorage();

        // test(uint8[][][]): 0x20, 2, 0x40, 0x60, 0, 2, 0x40, 0x80, 1, 7, 2, 8, 9
        // outer[0] is empty, outer[1] = [[7], [8, 9]]
        uint8[][][] memory d1 = new uint8[][][](2);
        d1[0] = new uint8[][](0);
        d1[1] = new uint8[][](2);
        d1[1][0] = new uint8[](1); d1[1][0][0] = 7;
        d1[1][1] = new uint8[](2); d1[1][1][0] = 8; d1[1][1][1] = 9;
        c.runTest(d1);

        // test2(uint8[][]): 0x20, 2, 0x40, 0x80, 1, 7, 2, 8, 9
        uint8[][] memory d2 = new uint8[][](2);
        d2[0] = new uint8[](1); d2[0][0] = 7;
        d2[1] = new uint8[](2); d2[1][0] = 8; d2[1][1] = 9;
        c.run2(d2);
    }
}
