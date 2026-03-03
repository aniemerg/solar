// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;
pragma abicoder v2;

import "../src/StorageBoundaryStructArrayPacked.sol";

contract StorageBoundaryStructArrayPackedTest {
    StorageBoundaryStructArrayPacked c;

    function setUp() public {
        c = new StorageBoundaryStructArrayPacked();
    }

    function test_StorageBoundaryStructArrayPacked() public {
        assert(c.canaryValue() == type(uint256).max);
        StorageBoundaryStructArrayPacked.S[10] memory ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 0 && ba[i].b == 0 && ba[i].c == 0 && ba[i].d == 0);
        }
        StorageBoundaryStructArrayPacked.S[10] memory da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == 0 && da[i].b == 0 && da[i].c == 0 && da[i].d == 0);
        }

        c.fillBoundaryArray();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == uint64(1 + i * 4));
            assert(ba[i].b == uint64(2 + i * 4));
            assert(ba[i].c == uint64(3 + i * 4));
            assert(ba[i].d == uint64(4 + i * 4));
        }
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) assert(da[i].a == 0);

        c.copyFromBoundary();
        assert(c.canaryValue() == type(uint256).max);
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == uint64(1 + i * 4));
        }

        c.fillDestArray();
        assert(c.canaryValue() == type(uint256).max);
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == uint64(41 + i * 4));
            assert(da[i].b == uint64(42 + i * 4));
            assert(da[i].c == uint64(43 + i * 4));
            assert(da[i].d == uint64(44 + i * 4));
        }

        c.copyToBoundary();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == uint64(41 + i * 4));
        }

        c.deleteBoundaryArray();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 0 && ba[i].b == 0 && ba[i].c == 0 && ba[i].d == 0);
        }
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) assert(da[i].a == uint64(41 + i * 4));
    }
}
