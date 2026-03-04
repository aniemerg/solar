// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/DynamicOutOfBoundsArrayAccess.sol";

contract DynamicOutOfBoundsArrayAccessTest is Test {
    function test_DynamicOutOfBoundsArrayAccess() public {
        DynamicOutOfBoundsArrayAccess c = new DynamicOutOfBoundsArrayAccess();
        assertEq(c.length(), 0);

        vm.expectRevert();
        c.get(3);

        assertEq(c.enlarge(4), 4);
        assertEq(c.length(), 4);
        assertTrue(c.set(3, 4));
        assertEq(c.get(3), 4);
        assertEq(c.length(), 4);

        vm.expectRevert();
        c.set(4, 8);

        assertEq(c.length(), 4);
    }
}
