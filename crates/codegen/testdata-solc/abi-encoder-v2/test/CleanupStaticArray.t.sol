// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupStaticArray.sol";

contract CleanupStaticArrayTest is Test {
    CleanupStaticArray c;

    function setUp() public {
        c = new CleanupStaticArray();
    }

    function test_f_valid() public {
        // f(uint256,uint256): 1, 1 -> valid (ABI encoder masks to uint8)
        bytes memory result = c.f(1, 1);
        assertTrue(result.length > 0);
    }

    function test_gggggggg_valid() public {
        // gggggggg(uint8[2]): 1, 1 -> valid
        uint8[2] memory s = [uint8(1), 1];
        bytes memory result = c.gggggggg(s);
        assertTrue(result.length > 0);
    }

    function test_gggggggg_invalid_reverts() public {
        // gggggggg(uint8[2]): 0x0101, 0x0101 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupStaticArray.gggggggg.selector,
            uint256(0x0101),
            uint256(0x0101)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
