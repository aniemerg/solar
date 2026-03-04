// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/CalldataArraysTooLarge.sol";

// Ported from: abiEncoderV1/calldata_arrays_too_large.sol
// f(uint256,uint256[],uint256): 6, 0x60, 9, 0x8000000000000000000000000000000000000000000000000000000000000002, 1, 2 -> FAILURE
// When array length in calldata is extremely large (overflows), the call should revert
contract CalldataArraysTooLargeTest is Test {
    CalldataArraysTooLarge c;

    function setUp() public {
        c = new CalldataArraysTooLarge();
    }

    function test_f_reverts_with_oversized_array() public {
        // Craft calldata with a huge array length that will cause OOB
        bytes memory callData = abi.encodeWithSelector(
            CalldataArraysTooLarge.f.selector
        );
        // Manually build calldata: a=6, offset for b=0x60, c=9, length of b=huge, then 2 elements
        callData = abi.encodePacked(
            CalldataArraysTooLarge.f.selector,
            uint256(6),                 // a
            uint256(0x60),              // offset to b
            uint256(9),                 // c
            uint256(0x8000000000000000000000000000000000000000000000000000000000000002), // huge length
            uint256(1),                 // b[0]
            uint256(2)                  // b[1]
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
