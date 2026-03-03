// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;
pragma abicoder v2;

import "../src/StorageBoundaryStructArrayMixedTypes.sol";

contract StorageBoundaryStructArrayMixedTypesTest {
    StorageBoundaryStructArrayMixedTypes c;

    function setUp() public {
        c = new StorageBoundaryStructArrayMixedTypes();
    }

    function test_StorageBoundaryStructArrayMixedTypes() public {
        assert(c.canaryValue() == type(uint256).max);
        StorageBoundaryStructArrayMixedTypes.S[10] memory ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 0 && ba[i].b == 0 && ba[i].c == 0 && ba[i].e == false);
        }

        c.fillBoundaryArray();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 1 + i * 5);
            assert(ba[i].b == uint128(2 + i * 5));
            assert(ba[i].c == uint64(3 + i * 5));
            assert(ba[i].d == bytes32(uint256(4 + i * 5)));
            assert(ba[i].e == true);
        }

        c.copyFromBoundary();
        assert(c.canaryValue() == type(uint256).max);
        StorageBoundaryStructArrayMixedTypes.S[10] memory da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == 1 + i * 5);
        }

        c.fillDestArray();
        assert(c.canaryValue() == type(uint256).max);
        da = c.destArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(da[i].a == 51 + i * 5);
            assert(da[i].b == uint128(52 + i * 5));
        }

        c.copyToBoundary();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 51 + i * 5);
        }

        c.deleteBoundaryArray();
        assert(c.canaryValue() == type(uint256).max);
        ba = c.boundaryArray();
        for (uint256 i = 0; i < 10; i++) {
            assert(ba[i].a == 0 && ba[i].b == 0 && ba[i].c == 0 && ba[i].e == false);
        }
    }
}
