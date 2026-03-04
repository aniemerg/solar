// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/DynamicArraysInStorage.sol";

contract DynamicArraysInStorageTest is Test {
    function test_DynamicArraysInStorage() public {
        DynamicArraysInStorage c = new DynamicArraysInStorage();
        (uint256 l1, uint256 l2) = c.getLengths();
        assertEq(l1, 0);
        assertEq(l2, 0);

        c.setLengths(48, 49);
        (l1, l2) = c.getLengths();
        assertEq(l1, 48);
        assertEq(l2, 49);

        c.setIDStatic(11);
        assertEq(c.getID(2), 11);

        c.setID(7, 8);
        assertEq(c.getID(7), 8);

        c.setData(7, 8, 9);
        c.setData(8, 10, 11);
        (uint256 x, uint256 y) = c.getData(7);
        assertEq(x, 8);
        assertEq(y, 9);
        (x, y) = c.getData(8);
        assertEq(x, 10);
        assertEq(y, 11);
    }
}
