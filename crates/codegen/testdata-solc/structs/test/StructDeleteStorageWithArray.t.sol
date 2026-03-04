// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteStorageWithArray.sol";

contract StructDeleteStorageWithArrayTest {
    StructDeleteStorageWithArray c;

    function setUp() public {
        c = new StructDeleteStorageWithArray();
    }

    function test_StructDeleteStorageWithArray() public {
        c.f();
        c.g();
    }
}
