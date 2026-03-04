// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataArrayInvalidLength.sol";

contract CalldataArrayInvalidLengthTest is Test {
    CalldataArrayInvalidLength c;

    function setUp() public {
        c = new CalldataArrayInvalidLength();
    }

    function test_CalldataArrayInvalidLength() public {
        // f(uint256[][]): 0x20, 1, 0x20, 0x0100000000000000000000 -> FAILURE
        // Inner array has an impossibly large length
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint256[][])")),
            uint256(0x20),
            uint256(1),
            uint256(0x20),
            bytes32(hex"0100000000000000000000000000000000000000000000000000000000000000")
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
