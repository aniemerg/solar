// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataArraysTooLarge.sol";

contract CalldataArraysTooLargeTest is Test {
    CalldataArraysTooLarge c;

    function setUp() public {
        c = new CalldataArraysTooLarge();
    }

    function test_CalldataArraysTooLarge() public {
        // f(uint256,uint256[],uint256): 6, 0x60, 9, 0x1000...0002, 1, 2
        // Array length is astronomically large -> FAILURE (invalid calldata array length)
        bytes memory payload = abi.encodePacked(
            bytes4(keccak256("f(uint256,uint256[],uint256)")),
            uint256(6),
            uint256(0x60),
            uint256(9),
            bytes32(hex"1000000000000000000000000000000000000000000000000000000000000002"),
            uint256(1),
            uint256(2)
        );
        (bool ok,) = address(c).call(payload);
        assert(!ok);
    }
}
