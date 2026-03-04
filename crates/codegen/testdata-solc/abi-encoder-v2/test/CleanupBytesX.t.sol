// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupBytesX.sol";

contract CleanupBytesXTest is Test {
    CleanupBytesX c;

    function setUp() public {
        c = new CleanupBytesX();
    }

    function test_f1_zero() public {
        assertEq(c.f1(bytes32(0)), bytes32(0));
    }

    function test_f1_valid() public {
        // f1(bytes32): left(0xFF) -> left(0xFF)
        bytes32 input = bytes32(0xFF00000000000000000000000000000000000000000000000000000000000000);
        bytes32 expected = bytes32(0xFF00000000000000000000000000000000000000000000000000000000000000);
        assertEq(c.f1(input), expected);
    }

    function test_f1_mask() public {
        // f1(bytes32): left(0x0001) -> left(0x00)
        // bytes1 masks to top byte only
        bytes32 input = bytes32(0x0001000000000000000000000000000000000000000000000000000000000000);
        bytes32 expected = bytes32(0);
        assertEq(c.f1(input), expected);
    }

    function test_gg1_invalid_reverts() public {
        // gg1(bytes1): left(0x0001) -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupBytesX.gg1.selector,
            bytes32(0x0001000000000000000000000000000000000000000000000000000000000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f2_valid() public {
        bytes32 input = bytes32(0xFFFF000000000000000000000000000000000000000000000000000000000000);
        assertEq(c.f2(input), input);
    }

    function test_gg2_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupBytesX.gg2.selector,
            bytes32(0x0000010000000000000000000000000000000000000000000000000000000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f4_valid() public {
        bytes32 input = bytes32(0xFFFFFFFF00000000000000000000000000000000000000000000000000000000);
        assertEq(c.f4(input), input);
    }

    function test_gg4_invalid_reverts() public {
        bytes memory callData = abi.encodePacked(
            CleanupBytesX.gg4.selector,
            bytes32(0x0000000001000000000000000000000000000000000000000000000000000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
