// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructMemoryToStorage.sol";

contract StructMemoryToStorageTest {
    StructMemoryToStorage c;

    function setUp() public {
        c = new StructMemoryToStorage();
    }

    function test_StructMemoryToStorage() public {
        (uint32 a, uint128 b, uint256 cc) = c.f();
        assert(a == 42 && b == 23 && cc == 34);
    }
}
