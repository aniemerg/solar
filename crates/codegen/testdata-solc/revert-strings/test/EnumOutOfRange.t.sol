// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EnumOutOfRange.sol";

contract EnumOutOfRangeTest is Test {
    EnumOutOfRange c;

    function setUp() public {
        c = new EnumOutOfRange();
    }

    function test_EnumOutOfRange() public {
        // f(uint8[]): 0x20, 2, 3, 3 -> FAILURE (enum out of range)
        // Selector for f(uint8[])
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint8[])")),
            abi.encode(uint256(0x20), uint256(2), uint256(3), uint256(3))
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
