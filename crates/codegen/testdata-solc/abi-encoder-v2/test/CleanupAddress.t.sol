// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupAddress.sol";

contract CleanupAddressTest is Test {
    CleanupAddress c;

    function setUp() public {
        c = new CleanupAddress();
    }

    function test_f_zero() public {
        // f(uint256): 0 -> 0
        assertEq(c.f(0), 0);
    }

    function test_g_zero() public {
        // g(address): 0 -> 0
        assertEq(c.g(address(0)), 0);
    }

    function test_f_one() public {
        // f(uint256): 1 -> 1
        assertEq(c.f(1), 1);
    }

    function test_f_valid_address() public {
        // f(uint256): 0xabcdef0123456789abcdef0123456789abcdefff -> same
        uint256 val = uint256(uint160(0xAbcdEf0123456789ABCDEf0123456789aBCDeFFF));
        assertEq(c.f(val), val);
    }

    function test_f_overflow_masked() public {
        // f(uint256): 0x010000000000000000000000000000000000000000 -> 0
        // When stored as address, high bits are masked off
        uint256 val = 0x010000000000000000000000000000000000000000;
        assertEq(c.f(val), 0);
    }

    function test_g_overflow_reverts() public {
        // g(address): 0x010000000000000000000000000000000000000000 -> FAILURE
        // Non-canonical address (bits above 160) causes revert in v2 ABI decoding
        bytes memory callData = abi.encodePacked(
            CleanupAddress.g.selector,
            uint256(0x010000000000000000000000000000000000000000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_g_neg1_reverts() public {
        // g(address): -1 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupAddress.g.selector,
            uint256(type(uint256).max)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_neg1_returns_max_address() public {
        // f(uint256): -1 -> 0xffffffffffffffffffffffffffffffffffffffff
        // assembly stores all 1s into address, mask to 20 bytes
        uint256 result = c.f(type(uint256).max);
        assertEq(result, uint256(uint160(type(uint160).max)));
    }
}
