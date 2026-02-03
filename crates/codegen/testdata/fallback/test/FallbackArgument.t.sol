// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackArgument.sol";

contract FallbackArgumentTest {
    FallbackArgument c;

    function setUp() public {
        c = new FallbackArgument();
    }

    function test_FallbackArgument() public {
        (bool ok, bytes memory ret) = c.f();
        assert(ok);
        assert(ret.length == 0);
        assert(c.x() == 3);
    }
}
