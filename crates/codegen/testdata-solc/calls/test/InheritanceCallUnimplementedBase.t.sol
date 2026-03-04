// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceCallUnimplementedBase.sol";

contract InheritanceCallUnimplementedBaseTest {
    InheritanceCallUnimplementedBase c;

    function setUp() public {
        c = new InheritanceCallUnimplementedBase();
    }

    function test_b_returns_42() public view {
        assert(c.b() == 42);
    }
}
