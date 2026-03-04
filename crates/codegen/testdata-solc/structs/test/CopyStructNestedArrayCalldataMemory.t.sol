// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyStructNestedArrayCalldataMemory.sol";

contract CopyStructNestedArrayCalldataMemoryTest {
    CopyStructNestedArrayCalldataMemory c;

    function setUp() public {
        c = new CopyStructNestedArrayCalldataMemory();
    }

    function test_CopyStructNestedArrayCalldataMemory() public view {
        uint8[] memory y1 = new uint8[](2);
        y1[0] = 7;
        y1[1] = 11;
        CopyStructNestedArrayCalldataMemory.S memory s1;
        s1.x[0] = 3;
        s1.y = y1;

        CopyStructNestedArrayCalldataMemory.S memory r1 = c.test(s1);
        assert(r1.x[0] == 3);
        assert(r1.y.length == 2 && r1.y[0] == 7 && r1.y[1] == 11);

        uint8[] memory y2 = new uint8[](3);
        y2[0] = 17;
        y2[1] = 19;
        y2[2] = 23;
        CopyStructNestedArrayCalldataMemory.S memory s2;
        s2.x[0] = 3;
        s2.y = y2;

        CopyStructNestedArrayCalldataMemory.S memory r2 = c.test(s2);
        assert(r2.x[0] == 3);
        assert(r2.y.length == 3 && r2.y[0] == 17 && r2.y[1] == 19 && r2.y[2] == 23);
    }
}
