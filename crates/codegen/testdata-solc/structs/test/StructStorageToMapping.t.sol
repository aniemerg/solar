// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructStorageToMapping.sol";

contract StructStorageToMappingTest {
    StructStorageToMapping c;

    function setUp() public {
        c = new StructStorageToMapping();
    }

    function test_StructStorageToMapping() public {
        assert(c.f() == true);
    }
}
