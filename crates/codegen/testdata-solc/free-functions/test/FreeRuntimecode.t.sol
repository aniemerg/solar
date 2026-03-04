// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FreeRuntimecode.sol";

contract FreeRuntimecodeTest {
    function test_FreeRuntimecode() public {
        FreeRuntimecode c = new FreeRuntimecode();
        assert(c.f() == true);
    }
}
