// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ValidationFunctionTypeInsideStruct.sol";

contract ValidationFunctionTypeInsideStructTest is Test {
    ValidationFunctionTypeInsideStruct c;

    function setUp() public {
        c = new ValidationFunctionTypeInsideStruct();
    }

    function test_f_valid() public {
        // f((function)): "01234567890123456789abcd" -> 1
        // memory function type - 24 bytes valid, no trailing bytes required
        // Just test with a zero function type
        ValidationFunctionTypeInsideStruct.S memory s;
        assertEq(c.f(s), 1);
    }

    function test_f_invalid_reverts() public {
        // f((function)): "01234567890123456789abcdX" -> FAILURE
        // The X (0x58) byte makes the 25th byte non-zero, which is past the 24-byte function type
        // In memory, Solidity packs it in a 32-byte slot but validates top 8 bytes must be 0
        bytes memory callData = abi.encodePacked(
            ValidationFunctionTypeInsideStruct.f.selector,
            bytes32(hex"3031323334353637383930313233343536373839616263645800000000000000")
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_g_valid() public {
        // g((function)): "01234567890123456789abcd" -> 2
        // g does NOT validate s.x, just returns 2
        bytes memory callData = abi.encodePacked(
            ValidationFunctionTypeInsideStruct.g.selector,
            bytes32(hex"3031323334353637383930313233343536373839616263640000000000000000")
        );
        (bool success, bytes memory data) = address(c).call(callData);
        assertTrue(success);
        assertEq(abi.decode(data, (uint256)), 2);
    }

    function test_g_invalid_still_succeeds() public {
        // g((function)): "01234567890123456789abcdX" -> 2 (g does not validate!)
        bytes memory callData = abi.encodePacked(
            ValidationFunctionTypeInsideStruct.g.selector,
            bytes32(hex"3031323334353637383930313233343536373839616263645800000000000000")
        );
        (bool success, bytes memory data) = address(c).call(callData);
        assertTrue(success);
        assertEq(abi.decode(data, (uint256)), 2);
    }

    function test_h_valid() public {
        // h((function)): "01234567890123456789abcd" -> 3
        bytes memory callData = abi.encodePacked(
            ValidationFunctionTypeInsideStruct.h.selector,
            bytes32(hex"3031323334353637383930313233343536373839616263640000000000000000")
        );
        (bool success, bytes memory data) = address(c).call(callData);
        assertTrue(success);
        assertEq(abi.decode(data, (uint256)), 3);
    }

    function test_h_invalid_reverts() public {
        // h((function)): "01234567890123456789abcdX" -> FAILURE (h validates s.x)
        bytes memory callData = abi.encodePacked(
            ValidationFunctionTypeInsideStruct.h.selector,
            bytes32(hex"3031323334353637383930313233343536373839616263645800000000000000")
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
