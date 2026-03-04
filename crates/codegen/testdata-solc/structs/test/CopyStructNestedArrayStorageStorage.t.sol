// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyStructNestedArrayStorageStorage.sol";

contract CopyStructNestedArrayStorageStorageTest {
    CopyStructNestedArrayStorageStorage c;

    function setUp() public {
        c = new CopyStructNestedArrayStorageStorage();
    }

    function test_CopyStructNestedArrayStorageStorage() public {
        c.test();
    }
}
