// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CodeAccessRuntime.sol";

contract CodeAccessRuntimeTest {
    CodeAccessRuntime c;

    function setUp() public {
        c = new CodeAccessRuntime();
    }

    function test_test() public {
        assert(c.test() == 42);
    }
}
