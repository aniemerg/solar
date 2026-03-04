// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStorageMultiItemsPerSlot.sol";

contract ArrayStorageMultiItemsPerSlotTest {
    function test_ArrayStorageMultiItemsPerSlot() public {
        ArrayStorageMultiItemsPerSlot c = new ArrayStorageMultiItemsPerSlot();
        // f() -> 1, 2, 3
        (uint8 a, uint32 b, uint120 cc) = c.f();
        assert(a == 1);
        assert(b == 2);
        assert(cc == 3);
    }
}
