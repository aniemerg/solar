// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToMapping.sol";

contract InternalLibraryFunctionAttachedToMappingTest {
    InternalLibraryFunctionAttachedToMapping c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToMapping();
    }

    function test_mapValue() public {
        // mapValue(uint256): 42 -> 0x24
        assert(c.mapValue(42) == 0x24);
    }
}
