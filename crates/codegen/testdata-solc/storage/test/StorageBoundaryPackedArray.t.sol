// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryPackedArray.sol";

contract StorageBoundaryPackedArrayTest {
    StorageBoundaryPackedArray c;

    function setUp() public {
        c = new StorageBoundaryPackedArray();
    }

    function test_StorageBoundaryPackedArray() public {
        uint64[40] memory init = c.x();
        for (uint256 i = 0; i < 40; i++) assert(init[i] == 0);

        c.fillArray();
        uint64[40] memory filled = c.x();
        assert(filled[0] == 0);
        for (uint256 i = 1; i < 40; i++) assert(filled[i] == uint64(i));

        c.clearArray();
        uint64[40] memory cleared = c.x();
        for (uint256 i = 0; i < 40; i++) assert(cleared[i] == 0);
    }
}
