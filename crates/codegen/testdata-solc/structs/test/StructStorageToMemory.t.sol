// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructStorageToMemory.sol";

contract StructStorageToMemoryTest {
    StructStorageToMemory c;

    function setUp() public {
        c = new StructStorageToMemory();
    }

    function test_StructStorageToMemory() public view {
        (uint32 a, uint128 b, uint256 cc) = c.f();
        assert(a == 42 && b == 23 && cc == 34);
    }
}
