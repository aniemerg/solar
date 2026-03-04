// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OverloadedFunctionCallResolveToFirst.sol";

contract OverloadedFunctionCallResolveToFirstTest {
    OverloadedFunctionCallResolveToFirst t;

    function setUp() public {
        t = new OverloadedFunctionCallResolveToFirst();
    }

    function test_OverloadedFunctionCallResolveToFirst() public {
        assert(t.g() == 3);
    }
}
