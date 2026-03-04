// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupDynamicArray.sol";

contract CleanupDynamicArrayTest is Test {
    CleanupDynamicArray c;

    function setUp() public {
        c = new CleanupDynamicArray();
    }

    function test_f_valid_small_values() public {
        // f(uint256[]): 0x20, 2, 1, 1 -> valid (values fit in uint8)
        uint256[] memory a = new uint256[](2);
        a[0] = 1; a[1] = 1;
        bytes memory result = c.f(a);
        assertTrue(result.length > 0);
    }

    function test_ggg_valid() public {
        // ggg(uint8[]): 0x20, 2, 1, 1 -> valid
        uint8[] memory s = new uint8[](2);
        s[0] = 1; s[1] = 1;
        bytes memory result = c.ggg(s);
        assertTrue(result.length > 0);
    }

    function test_ggg_invalid_reverts() public {
        // ggg(uint8[]): 0x20, 2, 0x0101, 0x0101 -> FAILURE (values > 0xFF)
        bytes memory callData = abi.encodePacked(
            CleanupDynamicArray.ggg.selector,
            uint256(0x20),
            uint256(2),
            uint256(0x0101),
            uint256(0x0101)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
