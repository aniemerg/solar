// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStaticZeroedMemoryIndexAccess.sol";

contract ArrayStaticZeroedMemoryIndexAccessTest {
    function test_ArrayStaticZeroedMemoryIndexAccess() public {
        ArrayStaticZeroedMemoryIndexAccess c = new ArrayStaticZeroedMemoryIndexAccess();
        assert(c.set("01234567890123456789012345678901") == 0);
    }
}
