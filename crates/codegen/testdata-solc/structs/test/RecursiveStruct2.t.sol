// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RecursiveStruct2.sol";

contract RecursiveStruct2Test {
    RecursiveStruct2 c;

    function setUp() public {
        c = new RecursiveStruct2();
    }

    function test_RecursiveStruct2() public {
        (uint256 a, uint256 b, uint256 cc, uint256 d) = c.f();
        assert(a == 0 && b == 0 && cc == 0 && d == 0);
    }
}
