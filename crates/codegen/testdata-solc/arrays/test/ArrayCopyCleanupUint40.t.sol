// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyCleanupUint40.sol";

contract ArrayCopyCleanupUint40Test {
    function test_ArrayCopyCleanupUint40() public {
        ArrayCopyCleanupUint40 c = new ArrayCopyCleanupUint40();
        assert(c.f() == true);
    }
}
