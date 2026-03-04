// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DeleteStorageArrayPacked.sol";

contract DeleteStorageArrayPackedTest is Test {
    function test_DeleteStorageArrayPacked() public {
        DeleteStorageArrayPacked c = new DeleteStorageArrayPacked();
        (uint120 a, uint120 b, uint120 d) = c.f();
        assertEq(a, 0);
        assertEq(b, 0);
        assertEq(d, 0);
    }
}
