// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedStorageStructsEnum.sol";

contract PackedStorageStructsEnumTest {
    PackedStorageStructsEnum c;

    function setUp() public {
        c = new PackedStorageStructsEnum();
    }

    function test_PackedStorageStructsEnum() public {
        assert(c.test() == 1);
    }
}
