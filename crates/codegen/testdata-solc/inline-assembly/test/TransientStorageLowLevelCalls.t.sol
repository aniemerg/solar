// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageLowLevelCalls.sol";

contract TransientStorageLowLevelCallsTest is Test {
    TransientStorageLowLevelCalls c;

    function setUp() public {
        c = new TransientStorageLowLevelCalls();
    }

    // testDelegateCall() -> true
    function test_testDelegateCall() public {
        assertEq(c.testDelegateCall(), true);
    }

    // testCall() -> true
    function test_testCall() public {
        assertEq(c.testCall(), true);
    }

    // tloadAllowedStaticCall() -> true
    function test_tloadAllowedStaticCall() public {
        assertEq(c.tloadAllowedStaticCall(), true);
    }

    // tstoreNotAllowedStaticCall() -> true
    function test_tstoreNotAllowedStaticCall() public {
        assertEq(c.tstoreNotAllowedStaticCall(), true);
    }
}
