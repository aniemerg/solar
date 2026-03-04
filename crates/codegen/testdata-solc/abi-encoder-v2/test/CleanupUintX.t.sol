// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupUintX.sol";

contract CleanupUintXTest is Test {
    CleanupUintX c;

    function setUp() public {
        c = new CleanupUintX();
    }

    function test_f8_zero() public {
        assertEq(c.f8(0), 0);
    }

    function test_f8_max() public {
        assertEq(c.f8(0xFF), 0xFF);
    }

    function test_f8_overflow_masked() public {
        // f8(uint256): 0x0100 -> 0x00 (masked to 8 bits)
        assertEq(c.f8(0x0100), 0);
    }

    function test_ggg8_invalid_reverts() public {
        // ggg8(uint8): 0x0100 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupUintX.ggg8.selector,
            uint256(0x0100)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_ggg8_neg1_reverts() public {
        // ggg8(uint8): -1 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupUintX.ggg8.selector,
            uint256(type(uint256).max)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f16_valid() public {
        assertEq(c.f16(0xFFFF), 0xFFFF);
        assertEq(c.f16(0x010000), 0); // masked
    }

    function test_gg16_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupUintX.gg16.selector,
            uint256(0x010000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f32_valid() public {
        assertEq(c.f32(0xFFFFFFFF), 0xFFFFFFFF);
    }

    function test_gg32_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupUintX.gg32.selector,
            uint256(0x0100000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f64_valid() public {
        assertEq(c.f64(0xFFFFFFFFFFFFFFFF), 0xFFFFFFFFFFFFFFFF);
    }

    function test_f128_valid() public {
        assertEq(c.f128(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    }

    function test_g128_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupUintX.g128.selector,
            uint256(0x0100000000000000000000000000000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
