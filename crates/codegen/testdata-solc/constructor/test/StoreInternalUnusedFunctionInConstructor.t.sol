// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreInternalUnusedFunctionInConstructor.sol";

contract StoreInternalUnusedFunctionInConstructorTest {
    function test_StoreInternalUnusedFunctionInConstructor() public {
        StoreInternalUnusedFunctionInConstructor c = new StoreInternalUnusedFunctionInConstructor();
        assert(c.t() == 7);
    }
}
