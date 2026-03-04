// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteStorage.sol";

contract StructDeleteStorageTest {
    StructDeleteStorage c;

    function setUp() public {
        c = new StructDeleteStorage();
    }

    function test_StructDeleteStorage() public {
        c.f();
    }
}
