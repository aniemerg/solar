// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteStorageWithArraysSmall.sol";

contract StructDeleteStorageWithArraysSmallTest {
    StructDeleteStorageWithArraysSmall c;

    function setUp() public {
        c = new StructDeleteStorageWithArraysSmall();
    }

    function test_StructDeleteStorageWithArraysSmall() public {
        (uint32 ra, uint32 rb0, uint32 rb1, uint256 rxlen) = c.f();
        assert(ra == 0 && rb0 == 0 && rb1 == 0 && rxlen == 0);
    }
}
