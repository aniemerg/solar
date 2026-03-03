// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryDeleteOverflowBug.sol";

contract StorageBoundaryDeleteOverflowBugTest {
    StorageBoundaryDeleteOverflowBug c;

    function setUp() public {
        c = new StorageBoundaryDeleteOverflowBug();
    }

    function test_StorageBoundaryDeleteOverflowBug() public {
        uint256[256] memory init = c.x();
        for (uint256 i = 0; i < 256; i++) assert(init[i] == 0);

        c.fillArray();
        uint256[256] memory filled = c.x();
        assert(filled[0] == 0);
        for (uint256 i = 1; i < 256; i++) assert(filled[i] == i);

        c.partialAssignArray();
        uint256[256] memory pv = c.x();
        assert(pv[0] == 11 && pv[1] == 22 && pv[2] == 33 && pv[3] == 44);
        assert(pv[4] == 55 && pv[5] == 66 && pv[6] == 77 && pv[7] == 88 && pv[8] == 99);
        for (uint256 i = 9; i < 256; i++) assert(pv[i] == 0);

        c.clearArray();
        uint256[256] memory cleared = c.x();
        for (uint256 i = 0; i < 256; i++) assert(cleared[i] == 0);
    }
}
