// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ShortFixedArrayCleanup.sol";

contract ShortFixedArrayCleanupTest is Test {
    function test_ShortFixedArrayCleanup() public {
        ShortFixedArrayCleanup c = new ShortFixedArrayCleanup();
        for (uint i = 0; i < 3; i++) assertEq(c.get(i), 0);
        c.fill();
        for (uint i = 0; i < 3; i++) assertEq(c.get(i), i + 1);
        c.clear();
        for (uint i = 0; i < 3; i++) assertEq(c.get(i), 0);
    }
}
