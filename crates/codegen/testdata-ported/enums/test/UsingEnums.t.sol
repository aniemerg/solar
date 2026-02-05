// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingEnums.sol";

contract UsingEnumsTest {
    UsingEnums c;

    function setUp() public {
        c = new UsingEnums();
    }

    function test_UsingEnums() public view {
        assert(c.getChoice() == 2);
    }
}
