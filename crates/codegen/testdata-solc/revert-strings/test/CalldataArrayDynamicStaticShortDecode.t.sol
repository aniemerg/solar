// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataArrayDynamicStaticShortDecode.sol";

contract CalldataArrayDynamicStaticShortDecodeTest is Test {
    CalldataArrayDynamicStaticShortDecode c;

    function setUp() public {
        c = new CalldataArrayDynamicStaticShortDecode();
    }

    function test_CalldataArrayDynamicStaticShortDecode() public {
        // f(uint256[][2][]): 0x20, 0x01, 0x20, 0x00 -> FAILURE ("Invalid calldata tail offset")
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint256[][2][])")),
            uint256(0x20),
            uint256(0x01),
            uint256(0x20),
            uint256(0x00)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
