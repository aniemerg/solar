// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SkipDynamicTypes.sol";

contract SkipDynamicTypesTest {
    SkipDynamicTypes c;

    function setUp() public {
        c = new SkipDynamicTypes();
    }

    function test_g() public {
        (uint256 a, uint256 b) = c.g();
        assert(a == 7);
        assert(b == 8);
    }
}
