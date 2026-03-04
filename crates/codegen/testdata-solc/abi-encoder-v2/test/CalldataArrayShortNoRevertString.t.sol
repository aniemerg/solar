// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayShortNoRevertString.sol";

contract CalldataArrayShortNoRevertStringTest is Test {
    CalldataArrayShortNoRevertString c;

    function setUp() public {
        c = new CalldataArrayShortNoRevertString();
    }

    function test_f_empty_succeeds() public {
        // f(uint256[]): 0x20, 0 ->
        uint[] memory arr = new uint[](0);
        c.f(arr);
    }

    function test_f_length1_no_data_reverts() public {
        // f(uint256[]): 0x20, 1 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataArrayShortNoRevertString.f.selector,
            uint256(0x20),
            uint256(1)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_length2_no_data_reverts() public {
        // f(uint256[]): 0x20, 2 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataArrayShortNoRevertString.f.selector,
            uint256(0x20),
            uint256(2)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
