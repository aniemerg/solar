// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackingUnpackingTypes.sol";

contract PackingUnpackingTypesTest {
    PackingUnpackingTypes c;

    function setUp() public {
        c = new PackingUnpackingTypes();
    }

    function test_run() public view {
        // run(bool,uint32,uint64): true, 0x0f0f0f0f, 0xf0f0f0f0f0f0f0f0
        // -> 0x0000000000000000000000000000000000000001f0f0f0f00f0f0f0f0f0f0f0f
        uint256 result = c.run(true, 0x0f0f0f0f, 0xf0f0f0f0f0f0f0f0);
        assert(result == 0x0000000000000000000000000000000000000001f0f0f0f00f0f0f0f0f0f0f0f);
    }
}
