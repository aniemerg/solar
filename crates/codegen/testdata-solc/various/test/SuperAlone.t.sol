// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SuperAlone.sol";

contract SuperAloneTest {
    SuperAlone c;

    function setUp() public {
        c = new SuperAlone();
    }

    function test_f() public {
        c.f();
    }
}
