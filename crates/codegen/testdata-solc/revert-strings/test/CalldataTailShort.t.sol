// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataTailShort.sol";

contract CalldataTailShortTest is Test {
    CalldataTailShort c;

    function setUp() public {
        c = new CalldataTailShort();
    }

    function test_CalldataTailShort() public {
        // f(uint256[][]): 0x20, 1, 0x20, 2, 0x42
        // Inner array has length 2 but only one element provided -> FAILURE ("Calldata tail too short")
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint256[][])")),
            uint256(0x20),
            uint256(1),
            uint256(0x20),
            uint256(2),
            uint256(0x42)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
