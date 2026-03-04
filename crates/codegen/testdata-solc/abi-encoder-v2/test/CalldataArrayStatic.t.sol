// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayStatic.sol";

contract CalldataArrayStaticTest is Test {
    CalldataArrayStatic c;

    function setUp() public {
        c = new CalldataArrayStatic();
    }

    function test_f() public {
        // f(uint256[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
        uint256[3] memory s = [uint256(23), 42, 87];
        bytes memory result = c.f(s);
        uint256[3] memory decoded = abi.decode(result, (uint256[3]));
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_g() public {
        // g(uint256[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
        uint256[3] memory s = [uint256(23), 42, 87];
        bytes memory result = c.g(s);
        uint256[3] memory decoded = abi.decode(result, (uint256[3]));
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_h_valid() public {
        // h(uint8[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
        uint8[3] memory s = [uint8(23), 42, 87];
        bytes memory result = c.h(s);
        uint8[3] memory decoded = abi.decode(result, (uint8[3]));
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_h_invalid_reverts() public {
        // h(uint8[3]): 0xFF23, 0x1242, 0xAB87 -> FAILURE
        // Values > 0xFF invalid for uint8
        bytes memory callData = abi.encodePacked(
            CalldataArrayStatic.h.selector,
            uint256(0xFF23), uint256(0x1242), uint256(0xAB87)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_i_invalid_reverts() public {
        // i(uint8[3]): 0xAB23, 0x1242, 0xFF87 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataArrayStatic.i.selector,
            uint256(0xAB23), uint256(0x1242), uint256(0xFF87)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
