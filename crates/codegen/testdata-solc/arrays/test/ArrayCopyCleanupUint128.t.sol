// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyCleanupUint128.sol";

contract ArrayCopyCleanupUint128Test {
    function test_ArrayCopyCleanupUint128() public {
        ArrayCopyCleanupUint128 c = new ArrayCopyCleanupUint128();
        assert(c.f() == true);
    }
}
