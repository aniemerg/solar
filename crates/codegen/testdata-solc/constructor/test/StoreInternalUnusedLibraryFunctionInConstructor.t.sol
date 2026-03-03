// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreInternalUnusedLibraryFunctionInConstructor.sol";

contract StoreInternalUnusedLibraryFunctionInConstructorTest {
    function test_StoreInternalUnusedLibraryFunctionInConstructor() public {
        StoreInternalUnusedLibraryFunctionInConstructor c = new StoreInternalUnusedLibraryFunctionInConstructor();
        assert(c.t() == 7);
    }
}
