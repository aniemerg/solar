// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructInternal.sol";

contract CalldataStructInternalTest {
    CalldataStructInternal c;

    function setUp() public {
        c = new CalldataStructInternal();
    }

    function test_CalldataStructInternal() public view {
        SInternal memory s = SInternal({x: 1, y: 2});
        (uint256 a, uint256 b) = c.f(7, s, 4);
        assert(a == 1);
        assert(b == 2);
    }
}
