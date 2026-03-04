// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupBytesTypesV2.sol";

contract CleanupBytesTypesV2Test {
    CleanupBytesTypesV2 c;

    function setUp() public {
        c = new CleanupBytesTypesV2();
    }

    function test_CleanupBytesTypesV2_Valid() public view {
        assert(c.f("ab", 0x0102) == 0);
    }

    // Under ABIv2, passing "abc" for bytes2 parameter with oversized data reverts
    function test_CleanupBytesTypesV2_OversizedBytes() public {
        // Encode "abc" (3 bytes) into bytes2 slot - dirty bytes should cause revert
        bytes memory data = abi.encodeWithSelector(
            CleanupBytesTypesV2.f.selector,
            bytes32("abc"),  // "abc" left-aligned (dirty extra byte)
            uint256(0x40102) // oversized uint16
        );
        (bool success,) = address(c).call(data);
        assert(!success);
    }
}
