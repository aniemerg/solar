// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MemoryArraysDelete.sol";

contract MemoryArraysDeleteTest is Test {
    function test_MemoryArraysDelete() public {
        MemoryArraysDelete c = new MemoryArraysDelete();
        uint24[3][4] memory result = c.del();
        // x[0] = (0, 1, 2)
        assertEq(result[0][0], 0);
        assertEq(result[0][1], 1);
        assertEq(result[0][2], 2);
        // x[1] deleted = (0, 0, 0)
        assertEq(result[1][0], 0);
        assertEq(result[1][1], 0);
        assertEq(result[1][2], 0);
        // x[2] = (0x20, 0x21, 0x22)
        assertEq(result[2][0], 0x20);
        assertEq(result[2][1], 0x21);
        assertEq(result[2][2], 0x22);
        // x[3] = (0x30, 0x31, 0) - x[3][2] deleted
        assertEq(result[3][0], 0x30);
        assertEq(result[3][1], 0x31);
        assertEq(result[3][2], 0);
    }
}
