// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;
pragma abicoder v2;

import "../src/StorageBoundaryStructArrayMultislot.sol";

contract StorageBoundaryStructArrayMultislotTest {
    StorageBoundaryStructArrayMultislot c;

    function setUp() public {
        c = new StorageBoundaryStructArrayMultislot();
    }

    function test_StorageBoundaryStructArrayMultislot() public {
        assert(c.canaryValue() == type(uint256).max);
        StorageBoundaryStructArrayMultislot.S[10] memory ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) assert(ba[i].a == 0 && ba[i].b == 0 && ba[i].c == 0);
        StorageBoundaryStructArrayMultislot.S[10] memory da = c.destArray();
        for (uint256 i = 0; i < 10; i++) assert(da[i].a == 0 && da[i].b == 0 && da[i].c == 0);

        c.fillBoundaryArray();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 1 + i * 3);
            assert(ba[i].b == 2 + i * 3);
            assert(ba[i].c == 3 + i * 3);
        }
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) assert(da[i].a == 0);

        c.copyFromBoundary();
        assert(c.canaryValue() == type(uint256).max);
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == 1 + i * 3);
            assert(da[i].b == 2 + i * 3);
            assert(da[i].c == 3 + i * 3);
        }

        c.fillDestArray();
        assert(c.canaryValue() == type(uint256).max);
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == 31 + i * 3);
            assert(da[i].b == 32 + i * 3);
            assert(da[i].c == 33 + i * 3);
        }

        c.copyToBoundary();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 31 + i * 3);
            assert(ba[i].b == 32 + i * 3);
            assert(ba[i].c == 33 + i * 3);
        }

        c.deleteBoundaryArray();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) assert(ba[i].a == 0 && ba[i].b == 0 && ba[i].c == 0);
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == 31 + i * 3);
        }
    }
}
