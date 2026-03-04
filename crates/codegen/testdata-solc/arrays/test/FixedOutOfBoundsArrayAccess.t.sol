// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FixedOutOfBoundsArrayAccess.sol";

contract FixedOutOfBoundsArrayAccessTest is Test {
    function test_FixedOutOfBoundsArrayAccess() public {
        FixedOutOfBoundsArrayAccess c = new FixedOutOfBoundsArrayAccess();
        assertEq(c.length(), 4);

        assertTrue(c.set(3, 4));

        vm.expectRevert();
        c.set(4, 5);

        vm.expectRevert();
        c.set(400, 5);

        assertEq(c.get(3), 4);

        vm.expectRevert();
        c.get(4);

        vm.expectRevert();
        c.get(400);

        assertEq(c.length(), 4);
    }
}
