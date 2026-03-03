// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryArrayDelete.sol";

contract StorageBoundaryArrayDeleteTest {
    StorageBoundaryArrayDelete c;

    function setUp() public {
        c = new StorageBoundaryArrayDelete();
    }

    function test_StorageBoundaryArrayDelete() public {
        uint256[10] memory init = c.x();
        for (uint256 i = 0; i < 10; i++) assert(init[i] == 0);

        c.fillArray();
        uint256[10] memory filled = c.x();
        assert(filled[0] == 0);
        for (uint256 i = 1; i < 10; i++) assert(filled[i] == i);

        c.clearArray();
        uint256[10] memory cleared = c.x();
        for (uint256 i = 0; i < 10; i++) assert(cleared[i] == 0);
    }
}
