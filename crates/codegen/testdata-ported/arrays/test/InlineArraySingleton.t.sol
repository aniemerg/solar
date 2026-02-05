// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineArraySingleton.sol";

contract InlineArraySingletonTest {
    function test_InlineArraySingleton() public {
        InlineArraySingleton c = new InlineArraySingleton();
        assert(c.f() == 4);
    }
}
