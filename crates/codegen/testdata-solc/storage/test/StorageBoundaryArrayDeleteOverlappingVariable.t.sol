// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryArrayDeleteOverlappingVariable.sol";

contract StorageBoundaryArrayDeleteOverlappingVariableTest {
    StorageBoundaryArrayDeleteOverlappingVariable c;

    function setUp() public {
        c = new StorageBoundaryArrayDeleteOverlappingVariable();
    }

    function test_StorageBoundaryArrayDeleteOverlappingVariable() public {
        // y is at slot 0; array spans slots (2^256-5) through 4
        // slot 5 maps to slot (2^256-5)+5 = 0 mod 2^256, which is slot 0 -> overlaps y
        assert(c.y() == 42);
        uint256[10] memory init = c.x();
        // slot 5 of array overlaps slot 0 (y=42)
        assert(init[5] == 42);

        c.fillArray();
        // After fill, slot 5 = index 5 = 5, which overwrites y
        assert(c.y() == 5);
        uint256[10] memory filled = c.x();
        assert(filled[0] == 0);
        for (uint256 i = 1; i < 10; i++) assert(filled[i] == i);

        c.clearArray();
        // After clear, slot 0 (y) gets zeroed
        assert(c.y() == 0);
        uint256[10] memory cleared = c.x();
        for (uint256 i = 0; i < 10; i++) assert(cleared[i] == 0);
    }
}
