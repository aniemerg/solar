// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopCopyLong.sol";

contract ByteArrayPopCopyLongTest is Test {
    function test_ByteArrayPopCopyLong() public {
        ByteArrayPopCopyLong c = new ByteArrayPopCopyLong();
        bytes memory result = c.runTest();
        assertEq(result.length, 29);
        for (uint256 i = 0; i < 29; i++) {
            assertEq(uint8(result[i]), 0x03);
        }
    }
}
