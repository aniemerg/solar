// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SkipDynamicTypesForStructs.sol";

contract SkipDynamicTypesForStructsTest {
    SkipDynamicTypesForStructs c;

    function setUp() public {
        c = new SkipDynamicTypesForStructs();
    }

    function test_g() public {
        (uint256 x, uint256 y) = c.g();
        assert(x == 2);
        assert(y == 6);
    }
}
