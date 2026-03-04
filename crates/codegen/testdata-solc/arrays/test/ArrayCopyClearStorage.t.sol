// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyClearStorage.sol";

contract ArrayCopyClearStorageTest {
    function test_ArrayCopyClearStorage() public {
        ArrayCopyClearStorage c = new ArrayCopyClearStorage();
        assert(c.f() == 0);
    }
}
