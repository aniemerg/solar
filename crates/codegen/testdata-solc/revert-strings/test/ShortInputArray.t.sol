// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ShortInputArray.sol";

contract ShortInputArrayTest is Test {
    ShortInputArray c;

    function setUp() public {
        c = new ShortInputArray();
    }

    function test_ShortInputArray() public {
        // f(uint256[]): 0x20, 1 -> FAILURE (invalid calldata array stride - data too short)
        // Array length is 1 but no element data follows
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint256[])")),
            uint256(0x20),
            uint256(1)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
