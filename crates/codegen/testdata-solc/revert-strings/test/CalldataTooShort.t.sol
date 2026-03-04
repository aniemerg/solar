// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataTooShort.sol";

contract CalldataTooShortTest is Test {
    CalldataTooShort c;

    function setUp() public {
        c = new CalldataTooShort();
    }

    function test_CalldataTooShort() public {
        // d(bytes): 0x20, 0x01, 0x00...00 -> FAILURE ("Calldata too short")
        // _data has only 1 byte, but abi.decode needs 32 bytes for uint8
        bytes memory oneByteData = new bytes(1);
        vm.expectRevert();
        c.d(oneByteData);
    }
}
