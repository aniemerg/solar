// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyStructNestedArrayMemoryMemory.sol";

contract CopyStructNestedArrayMemoryMemoryTest {
    CopyStructNestedArrayMemoryMemory c;

    function setUp() public {
        c = new CopyStructNestedArrayMemoryMemory();
    }

    function test_CopyStructNestedArrayMemoryMemory() public view {
        // returns default (zero-initialized) S regardless of input
        uint8[] memory y1 = new uint8[](2);
        y1[0] = 7;
        y1[1] = 11;
        CopyStructNestedArrayMemoryMemory.S memory s1;
        s1.x[0] = 3;
        s1.y = y1;

        CopyStructNestedArrayMemoryMemory.S memory r1 = c.test(s1);
        assert(r1.x[0] == 0);
        assert(r1.y.length == 0);

        uint8[] memory y2 = new uint8[](3);
        y2[0] = 17;
        y2[1] = 19;
        y2[2] = 23;
        CopyStructNestedArrayMemoryMemory.S memory s2;
        s2.x[0] = 3;
        s2.y = y2;

        CopyStructNestedArrayMemoryMemory.S memory r2 = c.test(s2);
        assert(r2.x[0] == 0);
        assert(r2.y.length == 0);
    }
}
