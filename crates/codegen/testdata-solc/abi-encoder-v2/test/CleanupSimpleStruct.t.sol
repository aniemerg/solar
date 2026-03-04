// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupSimpleStruct.sol";

contract CleanupSimpleStructTest is Test {
    CleanupSimpleStruct c;

    function setUp() public {
        c = new CleanupSimpleStruct();
    }

    function test_f_valid() public {
        // f(uint256,bytes32): 1, left(0x01) -> valid
        bytes32 b = bytes32(0x0100000000000000000000000000000000000000000000000000000000000000);
        bytes memory result = c.f(1, b);
        assertTrue(result.length > 0);
    }

    function test_f_invalid_overwrites_and_validates() public {
        // f(uint256,bytes32): 0x0101, left(0x0101) -> returns valid (f clamps before calling gg)
        // f assembles the struct and calls gg which validates
        bytes32 b = bytes32(0x0101000000000000000000000000000000000000000000000000000000000000);
        bytes memory result = c.f(0x0101, b);
        // f stores 0x0101 via mstore, which means uint8 a = 0x0101 truncated to 1 slot
        // But when calling this.gg(s), the ABI encoder will encode s.a as uint8
        // truncated to 0x01 and s.b as bytes1 truncated to 0x01
        // So gg receives canonical values -> success
        assertTrue(result.length > 0);
    }

    function test_gg_invalid_reverts() public {
        // gg((uint8,bytes1)): 0x0101, left(0x0101) -> FAILURE (non-canonical values)
        bytes memory callData = abi.encodePacked(
            CleanupSimpleStruct.gg.selector,
            uint256(0x0101),   // uint8 = 0x0101 - too big
            bytes32(0x0101000000000000000000000000000000000000000000000000000000000000) // bytes1 = 0x0101 - extra bytes set
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
