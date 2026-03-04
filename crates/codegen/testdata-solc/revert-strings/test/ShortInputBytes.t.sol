// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ShortInputBytes.sol";

contract ShortInputBytesTest is Test {
    ShortInputBytes c;

    function setUp() public {
        c = new ShortInputBytes();
    }

    function test_ShortInputBytes() public {
        // e(bytes): 0x20, 7 -> FAILURE (invalid byte array length - no actual bytes follow)
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("e(bytes)")),
            uint256(0x20),
            uint256(7)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
