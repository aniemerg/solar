// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructNamedConstructor.sol";

contract StructNamedConstructorTest {
    StructNamedConstructor c;

    function setUp() public {
        c = new StructNamedConstructor();
    }

    function test_StructNamedConstructor() public view {
        (uint256 a, bool x) = c.s();
        assert(a == 1);
        assert(x == true);
    }
}
