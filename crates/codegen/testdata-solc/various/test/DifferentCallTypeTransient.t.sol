// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DifferentCallTypeTransient.sol";

contract DifferentCallTypeTransientTest {
    DifferentCallTypeTransient c;

    function setUp() public {
        c = new DifferentCallTypeTransient();
    }

    function test_testDelegate() public {
        // delegatecall: executes in A's context, so A's transient value is set
        (uint256 aVal, uint256 bVal) = c.testDelegate();
        assert(aVal == 7);
        assert(bVal == 0);
    }

    function test_testCall() public {
        // regular call: executes in B's context, so B's transient value is set
        (uint256 aVal, uint256 bVal) = c.testCall();
        assert(aVal == 0);
        assert(bVal == 8);
    }

    function test_testStatic() public view {
        // staticcall: cannot modify state, returns false
        assert(c.testStatic() == false);
    }
}
