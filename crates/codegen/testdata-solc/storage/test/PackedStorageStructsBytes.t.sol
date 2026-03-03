// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedStorageStructsBytes.sol";

contract PackedStorageStructsBytesTest {
    PackedStorageStructsBytes c;

    function setUp() public {
        c = new PackedStorageStructsBytes();
    }

    function test_PackedStorageStructsBytes() public {
        assert(c.test() == true);
    }
}
