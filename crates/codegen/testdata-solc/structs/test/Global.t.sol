// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Global.sol";

contract GlobalTest {
    Global c;

    function setUp() public {
        c = new Global();
    }

    function test_Global() public view {
        GlobalS memory s;
        s.a = 42;
        s.b = 23;
        (uint256 a, uint256 b) = c.f(s);
        assert(a == 42 && b == 23);
    }
}
