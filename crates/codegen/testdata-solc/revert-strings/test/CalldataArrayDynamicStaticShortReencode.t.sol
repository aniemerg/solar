// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataArrayDynamicStaticShortReencode.sol";

contract CalldataArrayDynamicStaticShortReencodeTest is Test {
    CalldataArrayDynamicStaticShortReencode c;

    function setUp() public {
        c = new CalldataArrayDynamicStaticShortReencode();
    }

    function test_CalldataArrayDynamicStaticShortReencode() public {
        // g(uint256[][2][]): 0x20, 0x01, 0x20, 0x00 -> FAILURE ("Invalid calldata access offset")
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("g(uint256[][2][])")),
            uint256(0x20),
            uint256(0x01),
            uint256(0x20),
            uint256(0x00)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
