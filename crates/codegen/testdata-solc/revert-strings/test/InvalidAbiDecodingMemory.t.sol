// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidAbiDecodingMemory.sol";

contract InvalidAbiDecodingMemoryTest is Test {
    InvalidAbiDecodingMemory c;

    function setUp() public {
        c = new InvalidAbiDecodingMemory();
    }

    function test_InvalidAbiDecodingMemory_InvalidDataStart() public {
        // f(0, 0x200, 0x60): dyn returns crafted data with offset pointing far past data
        // -> FAILURE (ABI memory decoding: invalid data start)
        vm.expectRevert();
        c.f(0, 0x200, 0x60);
    }

    function test_InvalidAbiDecodingMemory_InvalidDataLength() public {
        // f(0, 0x20, 0x60): dyn returns crafted data with valid start but invalid length
        // -> FAILURE (ABI memory decoding: invalid data length)
        vm.expectRevert();
        c.f(0, 0x20, 0x60);
    }
}
