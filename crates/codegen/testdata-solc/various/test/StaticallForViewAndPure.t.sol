// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StaticallForViewAndPure.sol";

contract StaticallForViewAndPureTest {
    StaticallForViewAndPure c;

    function setUp() public {
        c = new StaticallForViewAndPure();
    }

    function test_f() public {
        // Regular call: works fine
        assert(c.f() == 1);
    }

    function test_fview_reverts() public {
        // Calling a state-mutating function via a view interface should revert
        // because a staticcall is used for view functions
        (bool success,) = address(c).call(abi.encodeWithSelector(c.fview.selector));
        assert(!success);
    }

    function test_fpure_reverts() public {
        // Same as above for pure
        (bool success,) = address(c).call(abi.encodeWithSelector(c.fpure.selector));
        assert(!success);
    }
}
