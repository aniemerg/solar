// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopMaskingLong.sol";

contract ByteArrayPopMaskingLongTest is Test {
    function test_ByteArrayPopMaskingLong() public {
        ByteArrayPopMaskingLong c = new ByteArrayPopMaskingLong();
        bytes memory result = c.runTest();
        assertEq(result.length, 33);
        for (uint256 i = 0; i < 33; i++) {
            assertEq(uint8(result[i]), 0x03);
        }
    }
}
