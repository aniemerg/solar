// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicStaticShortReencode.sol";

contract CalldataArrayDynamicStaticShortReencodeTest is Test {
    CalldataArrayDynamicStaticShortReencode c;

    function setUp() public {
        c = new CalldataArrayDynamicStaticShortReencode();
    }

    function test_g_valid() public {
        // g(uint256[][2][]): 0x20, 0x01, 0x20, 0x40, 0x60, 0x00, 0x00 -> 42
        uint256[][2][] memory x = new uint256[][2][](1);
        x[0][0] = new uint256[](0);
        x[0][1] = new uint256[](0);
        assertEq(c.g(x), 42);
    }

    function test_g_invalid_reverts() public {
        // g(uint256[][2][]): 0x20, 0x01, 0x20, 0x00 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataArrayDynamicStaticShortReencode.g.selector,
            uint256(0x20),
            uint256(0x01),
            uint256(0x20),
            uint256(0x00)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
