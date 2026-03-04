// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupIntX.sol";

contract CleanupIntXTest is Test {
    CleanupIntX c;

    function setUp() public {
        c = new CleanupIntX();
    }

    function test_f8_zero() public {
        assertEq(c.f8(0), 0);
    }

    function test_ggg8_zero() public {
        assertEq(c.ggg8(0), 0);
    }

    function test_f8_one() public {
        assertEq(c.f8(1), 1);
    }

    function test_f8_neg1() public {
        assertEq(c.f8(-1), -1);
    }

    function test_f8_max_int8() public {
        assertEq(c.f8(0x7F), 0x7F);
    }

    function test_f8_min_int8() public {
        // f8(int256): 0x80 -> -128 (sign extended)
        assertEq(c.f8(0x80), -128);
    }

    function test_ggg8_invalid_reverts() public {
        // ggg8(int8): 0x80 -> FAILURE (not canonical int8 - would be -128 but ABI expects sign-extended)
        bytes memory callData = abi.encodePacked(
            CleanupIntX.ggg8.selector,
            uint256(0x80)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_ggg8_0x0100_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupIntX.ggg8.selector,
            uint256(0x0100)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f16_valid() public {
        assertEq(c.f16(0x7FFF), 0x7FFF);
        assertEq(c.f16(-1), -1);
    }

    function test_gg16_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupIntX.gg16.selector,
            uint256(0x8000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f32_valid() public {
        assertEq(c.f32(0x7FFFFFFF), 0x7FFFFFFF);
        assertEq(c.f32(-1), -1);
    }

    function test_gg32_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupIntX.gg32.selector,
            uint256(0x80000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f64_valid() public {
        assertEq(c.f64(int256(0x7FFFFFFFFFFFFFFF)), int256(0x7FFFFFFFFFFFFFFF));
        assertEq(c.f64(-1), -1);
    }

    function test_f128_valid() public {
        assertEq(c.f128(int256(0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)), int256(0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
        assertEq(c.f128(-1), -1);
    }

    function test_g128_invalid_reverts() public {
        // g128(int128): 0x80000000000000000000000000000000 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupIntX.g128.selector,
            uint256(0x80000000000000000000000000000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
