// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayOfStructsContainingArraysCalldataToStorage.sol";

contract ArrayOfStructsContainingArraysCalldataToStorageTest {
    function test_ArrayOfStructsContainingArraysCalldataToStorage() public {
        ArrayOfStructsContainingArraysCalldataToStorage c = new ArrayOfStructsContainingArraysCalldataToStorage();
        // f((uint256[])[]): 0x20, 3, 0x60, 0x60, 0x60, 0x20, 3, 1, 2, 3 -> 3, 1
        ArrayOfStructsContainingArraysCalldataToStorage.S[] memory inp = new ArrayOfStructsContainingArraysCalldataToStorage.S[](3);
        inp[0].a = new uint256[](3);
        inp[0].a[0] = 1; inp[0].a[1] = 2; inp[0].a[2] = 3;
        inp[1].a = new uint256[](3);
        inp[1].a[0] = 1; inp[1].a[1] = 2; inp[1].a[2] = 3;
        inp[2].a = new uint256[](3);
        inp[2].a[0] = 1; inp[2].a[1] = 2; inp[2].a[2] = 3;
        (uint256 len, uint256 val) = c.f(inp);
        assert(len == 3);
        assert(val == 1);
    }
}
