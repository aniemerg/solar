// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataArrayDynamicInvalid.sol";

contract CalldataArrayDynamicInvalidTest is Test {
    CalldataArrayDynamicInvalid c;

    function setUp() public {
        c = new CalldataArrayDynamicInvalid();
    }

    function test_CalldataArrayDynamicInvalid() public {
        // f(uint256[][]): 0x20, 1 -> FAILURE (invalid calldata array stride)
        // Only offset and length provided, but the inner array data is missing
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint256[][])")),
            uint256(0x20),
            uint256(1)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
