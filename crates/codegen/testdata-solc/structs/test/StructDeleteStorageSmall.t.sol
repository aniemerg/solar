// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteStorageSmall.sol";

contract StructDeleteStorageSmallTest {
    StructDeleteStorageSmall c;

    function setUp() public {
        c = new StructDeleteStorageSmall();
    }

    function test_StructDeleteStorageSmall() public {
        (uint64 ry, uint64 rz) = c.f();
        assert(ry == 0 && rz == 0);
    }
}
