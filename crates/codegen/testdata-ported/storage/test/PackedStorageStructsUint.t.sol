// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedStorageStructsUint.sol";

contract PackedStorageStructsUintTest {
    PackedStorageStructsUint c;

    function setUp() public {
        c = new PackedStorageStructsUint();
    }

    function test_PackedStorageStructsUint() public {
        assert(c.test() == 1);
    }
}
