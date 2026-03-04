// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageSanityChecks.sol";

contract TransientStorageSanityChecksTest is Test {
    TransientStorageSanityChecks c;

    function setUp() public {
        c = new TransientStorageSanityChecks();
    }

    // f() -> (stores transient=21, mstore=42, sstore=42, checks transient==21)
    function test_f() public {
        c.f(); // Should not revert - tstore(0,21) and verify tload(0)==21
    }

    // After f(), g() in same tx: sstore persists, tstore persists within tx
    // Original test calls f() then g() as separate txs, but we simulate within one tx
    function test_g_after_f() public {
        c.f();
        (uint s, uint m, uint t) = c.g();
        assertEq(s, 0x2a); // sstore persists in same tx
        // Within same tx, transient storage from f() is visible
        assertEq(t, 21);
    }

    // g() fresh (without f first): all zeros
    function test_g_fresh() public {
        (uint s, uint m, uint t) = c.g();
        assertEq(s, 0);
        assertEq(m, 0);
        assertEq(t, 0);
    }
}
