// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SuperOverload.sol";

contract SuperOverloadTest {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_SuperOverload() public {
        assert(c.g() == 10);
        assert(c.h() == 2);
    }
}
