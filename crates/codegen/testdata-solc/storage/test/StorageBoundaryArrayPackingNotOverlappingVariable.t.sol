// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryArrayPackingNotOverlappingVariable.sol";

contract StorageBoundaryArrayPackingNotOverlappingVariableTest {
    StorageBoundaryArrayPackingNotOverlappingVariable c;

    function setUp() public {
        c = new StorageBoundaryArrayPackingNotOverlappingVariable();
    }

    function test_StorageBoundaryArrayPackingNotOverlappingVariable() public {
        uint64[10] memory init = c.x();
        for (uint256 i = 0; i < 10; i++) assert(init[i] == 0);
        assert(c.canaryValue() == type(uint256).max);

        c.fillArray();
        uint64[10] memory filled = c.x();
        for (uint256 i = 0; i < 10; i++) assert(filled[i] == uint64(i));
        assert(c.canaryValue() == type(uint256).max);

        c.shrinkTo5();
        uint64[10] memory shrunk = c.x();
        assert(shrunk[0] == 11 && shrunk[1] == 12 && shrunk[2] == 13 && shrunk[3] == 14 && shrunk[4] == 15);
        for (uint256 i = 5; i < 10; i++) assert(shrunk[i] == 0);
        assert(c.canaryValue() == type(uint256).max);

        c.clearArray();
        uint64[10] memory cleared = c.x();
        for (uint256 i = 0; i < 10; i++) assert(cleared[i] == 0);
        assert(c.canaryValue() == type(uint256).max);
    }
}
