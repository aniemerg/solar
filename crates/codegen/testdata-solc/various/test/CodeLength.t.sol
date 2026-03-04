// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CodeLength.sol";

contract CodeLengthTest {
    CodeLength c;

    function setUp() public {
        c = new CodeLength();
    }

    function test_f() public view {
        (bool r1, bool r2) = c.f();
        assert(r1 == true);
        assert(r2 == true);
    }
}
