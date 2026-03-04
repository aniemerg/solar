// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OverloadedFunctionCallWithIfElse.sol";

contract OverloadedFunctionCallWithIfElseTest {
    OverloadedFunctionCallWithIfElse t;

    function setUp() public {
        t = new OverloadedFunctionCallWithIfElse();
    }

    function test_OverloadedFunctionCallWithIfElse() public {
        assert(t.g(true) == 3);
        assert(t.g(false) == 10);
    }
}
