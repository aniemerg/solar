// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiFunctionsMemberAccess.sol";

contract AbiFunctionsMemberAccessTest {
    function test_f() public {
        AbiFunctionsMemberAccess c = new AbiFunctionsMemberAccess();
        c.f();
    }
}
