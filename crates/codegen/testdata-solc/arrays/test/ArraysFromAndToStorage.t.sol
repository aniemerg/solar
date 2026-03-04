// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArraysFromAndToStorage.sol";

contract ArraysFromAndToStorageTest is Test {
    function test_ArraysFromAndToStorage() public {
        ArraysFromAndToStorage c = new ArraysFromAndToStorage();

        // set(uint24[]): 0x20, 18, 1, 2, ..., 18 -> 18
        uint24[] memory inp = new uint24[](18);
        for (uint24 i = 0; i < 18; i++) inp[i] = i + 1;
        uint result = c.set(inp);
        assertEq(result, 18);

        // data(uint256): 7 -> 8
        assertEq(c.data(7), 8);
        // data(uint256): 15 -> 16
        assertEq(c.data(15), 16);
        // data(uint256): 18 -> FAILURE
        vm.expectRevert();
        c.data(18);

        // get() -> 0x20, 18, 1, 2, ..., 18
        uint24[] memory got = c.get();
        assertEq(got.length, 18);
        for (uint i = 0; i < 18; i++) {
            assertEq(got[i], uint24(i + 1));
        }
    }
}
