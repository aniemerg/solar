// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataDynamicNested.sol";

contract CalldataDynamicNestedTest {
    CalldataDynamicNested c;

    function setUp() public {
        c = new CalldataDynamicNested();
    }

    function test_CalldataDynamicNested() public view {
        CalldataDynamicNested.S2[] memory children = new CalldataDynamicNested.S2[](2);
        children[0].b = 23;
        children[1].b = 42;
        CalldataDynamicNested.S memory s;
        s.a = 17;
        s.children = children;
        (uint256 len, uint256 a, uint256 c0, uint256 c1) = c.f(s);
        assert(len == 2 && a == 17 && c0 == 23 && c1 == 42);
    }
}
