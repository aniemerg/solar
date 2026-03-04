// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteStorageNestedSmall.sol";

contract StructDeleteStorageNestedSmallTest {
    StructDeleteStorageNestedSmall c;

    function setUp() public {
        c = new StructDeleteStorageNestedSmall();
    }

    function test_StructDeleteStorageNestedSmall() public {
        (uint32 ra, uint256 rxlen) = c.f();
        assert(ra == 0 && rxlen == 0);
    }
}
