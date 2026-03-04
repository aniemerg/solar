// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FixedArraysInConstructors.sol";

contract FixedArraysInConstructorsTest is Test {
    function test_FixedArraysInConstructors() public {
        // constructor(): 1, 2, 3, 4 -> r=4, ch=3 (as addresses)
        address[3] memory s = [address(1), address(2), address(3)];
        FixedArraysInConstructors c = new FixedArraysInConstructors(s, 4);
        assertEq(c.r(), 4);
        assertEq(c.ch(), address(3));
    }
}
