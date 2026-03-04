// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LoneStructArrayType.sol";

contract LoneStructArrayTypeTest {
    LoneStructArrayType c;

    function setUp() public {
        c = new LoneStructArrayType();
    }

    function test_LoneStructArrayType() public view {
        assert(c.f() == 3);
    }
}
