// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayShort.sol";

contract CalldataArrayShortTest is Test {
    CalldataArrayShort c;

    function setUp() public {
        c = new CalldataArrayShort();
    }

    function test_f_empty_succeeds() public {
        // f(uint256[]): 0x20, 0 ->
        uint[] memory arr = new uint[](0);
        c.f(arr);
    }

    function test_f_length1_no_data_reverts() public {
        // f(uint256[]): 0x20, 1 -> FAILURE (length says 1 but no data follows)
        bytes memory callData = abi.encodePacked(
            CalldataArrayShort.f.selector,
            uint256(0x20),  // offset
            uint256(1)      // length = 1 but no element follows
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_length2_no_data_reverts() public {
        // f(uint256[]): 0x20, 2 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataArrayShort.f.selector,
            uint256(0x20),
            uint256(2)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
