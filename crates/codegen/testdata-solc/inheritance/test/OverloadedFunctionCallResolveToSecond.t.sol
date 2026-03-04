// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OverloadedFunctionCallResolveToSecond.sol";

contract OverloadedFunctionCallResolveToSecondTest {
    OverloadedFunctionCallResolveToSecond t;

    function setUp() public {
        t = new OverloadedFunctionCallResolveToSecond();
    }

    function test_OverloadedFunctionCallResolveToSecond() public {
        assert(t.g() == 10);
    }
}
