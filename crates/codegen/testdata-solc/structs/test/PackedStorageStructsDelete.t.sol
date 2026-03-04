// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedStorageStructsDelete.sol";

contract PackedStorageStructsDeleteTest {
    PackedStorageStructsDelete c;

    function setUp() public {
        c = new PackedStorageStructsDelete();
    }

    function test_PackedStorageStructsDelete() public {
        assert(c.test() == 1);
    }
}
