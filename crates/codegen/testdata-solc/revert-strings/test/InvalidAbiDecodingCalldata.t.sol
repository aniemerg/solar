// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidAbiDecodingCalldata.sol";

contract InvalidAbiDecodingCalldataTest is Test {
    InvalidAbiDecodingCalldata c;

    function setUp() public {
        c = new InvalidAbiDecodingCalldata();
    }

    function test_InvalidAbiDecodingCalldata_Valid() public view {
        // d(bytes): 0x20, 0x20, 0x00...00 -> 0 (valid: pointer at 0x20, 32 bytes of data)
        bytes memory data = new bytes(32);
        assert(c.d(data) == 0);
    }

    function test_InvalidAbiDecodingCalldata_InvalidHeadPointer() public {
        // d(bytes): 0x100, 0x20, 0x00...00 -> FAILURE (invalid head pointer, offset 0x100 out of range)
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("d(bytes)")),
            uint256(0x100),
            uint256(0x20),
            bytes32(0)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }

    function test_InvalidAbiDecodingCalldata_InvalidDataPointer() public {
        // d(bytes): 0x20, 0x100, 0x00...00 -> FAILURE (invalid data pointer, length 0x100 out of range)
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("d(bytes)")),
            uint256(0x20),
            uint256(0x100),
            bytes32(0)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
