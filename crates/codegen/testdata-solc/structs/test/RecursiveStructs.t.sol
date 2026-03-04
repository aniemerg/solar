// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RecursiveStructs.sol";

contract RecursiveStructsTest {
    RecursiveStructs c;

    function setUp() public {
        c = new RecursiveStructs();
    }

    function test_RecursiveStructs() public {
        assert(c.f() == 1);
    }
}
