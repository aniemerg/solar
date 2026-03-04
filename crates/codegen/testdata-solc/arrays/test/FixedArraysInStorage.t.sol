// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FixedArraysInStorage.sol";

contract FixedArraysInStorageTest is Test {
    function test_FixedArraysInStorage() public {
        FixedArraysInStorage c = new FixedArraysInStorage();
        c.setIDStatic(0xb);
        assertEq(c.getID(0x2), 0xb);

        c.setID(0x7, 0x8);
        assertEq(c.getID(0x7), 0x8);

        c.setData(0x7, 0x8, 0x9);
        c.setData(0x8, 0xa, 0xb);
        (uint256 x, uint256 y) = c.getData(0x7);
        assertEq(x, 0x8);
        assertEq(y, 0x9);
        (x, y) = c.getData(0x8);
        assertEq(x, 0xa);
        assertEq(y, 0xb);

        (uint256 l1, uint256 l2) = c.getLengths();
        assertEq(l1, 0x400);
        assertEq(l2, 0x403);
    }
}
