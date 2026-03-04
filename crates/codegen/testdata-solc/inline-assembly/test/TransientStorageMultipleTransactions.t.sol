// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageMultipleTransactions.sol";

contract TransientStorageMultipleTransactionsTest is Test {
    TransientStorageMultipleTransactions c;

    function setUp() public {
        c = new TransientStorageMultipleTransactions();
    }

    // g() -> 0 initially (fresh tx, tload returns 0)
    function test_g_initial() public {
        assertEq(c.g(), 0);
    }

    // h() -> 0x63 (99 decimal, set and get in same tx)
    function test_h() public {
        assertEq(c.h(), 0x63);
    }

    // After f() in same tx, g() returns 42 (transient storage visible in same tx)
    function test_f_then_g_same_tx() public {
        c.f();
        assertEq(c.g(), 42);
    }

    // g() -> 0 in a fresh tx (separate test function)
    function test_g_fresh_tx() public {
        assertEq(c.g(), 0);
    }
}
