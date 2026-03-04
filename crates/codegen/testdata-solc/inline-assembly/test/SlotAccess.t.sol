// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/SlotAccess.sol";

contract SlotAccessTest is Test {
    SlotAccess c;

    function setUp() public {
        c = new SlotAccess();
    }

    // get() -> 0
    // mappingAccess(uint256): 1 -> 0, 0
    // set(uint256): 4
    // get() -> 4
    // mappingAccess(uint256): 1 -> 4, 0
    function test_slot_access() public {
        assertEq(c.get(), 0);
        (uint a0, uint b0) = c.mappingAccess(1);
        assertEq(a0, 0);
        assertEq(b0, 0);

        c.set(4);

        assertEq(c.get(), 4);
        (uint a1, uint b1) = c.mappingAccess(1);
        assertEq(a1, 4);
        assertEq(b1, 0);
    }
}
