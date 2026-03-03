// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryArrayCopy.sol";

contract StorageBoundaryArrayCopyTest {
    StorageBoundaryArrayCopy c;

    function setUp() public {
        c = new StorageBoundaryArrayCopy();
    }

    function test_StorageBoundaryArrayCopy() public {
        uint256[10] memory xv = c.x();
        for (uint256 i = 0; i < 10; i++) assert(xv[i] == i + 1);
        uint256[10] memory yv = c.y();
        for (uint256 i = 0; i < 10; i++) assert(yv[i] == 0);

        c.copyXToY();
        uint256[10] memory y2 = c.y();
        for (uint256 i = 0; i < 10; i++) assert(y2[i] == i + 1);
        uint256[10] memory x2 = c.x();
        for (uint256 i = 0; i < 10; i++) assert(x2[i] == i + 1);

        c.clearX();
        uint256[10] memory x3 = c.x();
        for (uint256 i = 0; i < 10; i++) assert(x3[i] == 0);
        uint256[10] memory y3 = c.y();
        for (uint256 i = 0; i < 10; i++) assert(y3[i] == i + 1);

        c.copyYToX();
        uint256[10] memory x4 = c.x();
        for (uint256 i = 0; i < 10; i++) assert(x4[i] == i + 1);
        uint256[10] memory y4 = c.y();
        for (uint256 i = 0; i < 10; i++) assert(y4[i] == i + 1);
    }
}
