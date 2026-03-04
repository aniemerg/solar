// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SkipDynamicTypesForStaticArraysWithDynamicElements.sol";

contract SkipDynamicTypesForStaticArraysWithDynamicElementsTest {
    SkipDynamicTypesForStaticArraysWithDynamicElements c;

    function setUp() public {
        c = new SkipDynamicTypesForStaticArraysWithDynamicElements();
    }

    function test_g() public {
        (uint256 a, uint256 b) = c.g();
        assert(a == 5);
        assert(b == 6);
    }
}
