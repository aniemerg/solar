// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyStructNestedArrayCalldataStorage.sol";

contract CopyStructNestedArrayCalldataStorageTest {
    CopyStructNestedArrayCalldataStorage c;

    function setUp() public {
        c = new CopyStructNestedArrayCalldataStorage();
    }

    function test_CopyStructNestedArrayCalldataStorage() public {
        uint8[] memory y = new uint8[](2);
        y[0] = 7;
        y[1] = 11;
        CopyStructNestedArrayCalldataStorage.S memory s;
        s.x[0] = 3;
        s.y = y;
        c.run(s);
    }
}
