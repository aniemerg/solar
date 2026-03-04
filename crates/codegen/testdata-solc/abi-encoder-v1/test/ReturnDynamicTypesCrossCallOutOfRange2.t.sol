// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ReturnDynamicTypesCrossCallOutOfRange2.sol";

// Ported from: abiEncoderV1/return_dynamic_types_cross_call_out_of_range_2.sol
// EVMVersion: >homestead (so post-homestead behavior: strict ABI decoding)
// f(uint256): 0x60 -> FAILURE  (0x60 = 96 bytes, not enough for a valid bytes return)
// f(uint256): 0x61 -> true     (0x61 = 97 bytes, just enough)
// f(uint256): 0x80 -> true     (0x80 = 128 bytes)
contract ReturnDynamicTypesCrossCallOutOfRange2Test is Test {
    ReturnDynamicTypesCrossCallOutOfRange2 c;

    function setUp() public {
        c = new ReturnDynamicTypesCrossCallOutOfRange2();
    }

    function test_f_0x60_reverts() public {
        // 0x60 = 96 bytes returned, but valid bytes encoding needs:
        // offset(32) + length(32) + data(ceil(0x21/32)*32=32) = 96 total => 0x60 means
        // return 0 to 0x60 bytes: offset=0x20, length=0x21, but data starts at 0x40 and goes to 0x61
        // so 0x60 bytes is not enough to cover the data => revert
        vm.expectRevert();
        c.f(0x60);
    }

    function test_f_0x61_succeeds() public {
        bool result = c.f(0x61);
        assertTrue(result);
    }

    function test_f_0x80_succeeds() public {
        bool result = c.f(0x80);
        assertTrue(result);
    }
}
