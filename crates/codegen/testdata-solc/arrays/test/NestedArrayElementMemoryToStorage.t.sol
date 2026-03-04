// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NestedArrayElementMemoryToStorage.sol";

contract NestedArrayElementMemoryToStorageTest {
    function test_NestedArrayElementMemoryToStorage() public {
        NestedArrayElementMemoryToStorage c = new NestedArrayElementMemoryToStorage();

        // test(uint8[2][2][2]): 1, 2, 3, 4, 5, 6, 7, 8
        uint8[2][2][2] memory d;
        d[0][0][0] = 1; d[0][0][1] = 2;
        d[0][1][0] = 3; d[0][1][1] = 4;
        d[1][0][0] = 5; d[1][0][1] = 6;
        d[1][1][0] = 7; d[1][1][1] = 8;
        c.runTest(d);

        // test2(uint8[2][2]): 1, 2, 3, 4
        uint8[2][2] memory d2;
        d2[0][0] = 1; d2[0][1] = 2;
        d2[1][0] = 3; d2[1][1] = 4;
        c.runTest2(d2);
    }
}
