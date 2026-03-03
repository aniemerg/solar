// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataStructCleaning.sol";

contract CalldataStructCleaningTest is Test {
    CalldataStructCleaning c;

    function setUp() public {
        c = new CalldataStructCleaning();
    }

    function test_valid() public view {
        CalldataStructCleaning.S memory s = CalldataStructCleaning.S({a: 0x12, b: 0x34});
        (uint256 a, bytes32 b) = c.f(s);
        assert(a == 0x12);
        assert(b == bytes32(bytes1(0x34)));
    }

    function test_dirty_uint8() public {
        // a = 0x1234 which overflows uint8 - should revert
        (bool ok,) = address(c).call(
            abi.encodeWithSelector(
                CalldataStructCleaning.f.selector,
                uint256(0x1234), // dirty: high bits set for uint8 field
                bytes32(hex"5678000000000000000000000000000000000000000000000000000000000000")
            )
        );
        assert(!ok);
    }

    function test_dirty_all_ff() public {
        // a = 0xff..ff, b = 0xff..ff - should revert
        (bool ok,) = address(c).call(
            abi.encodeWithSelector(
                CalldataStructCleaning.f.selector,
                type(uint256).max,
                type(uint256).max
            )
        );
        assert(!ok);
    }
}
