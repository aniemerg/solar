// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionStorageMemory2.sol";

contract ConditionalExpressionStorageMemory2Test {
    function test_storageToMemoryAssignment() public {
        ConditionalExpressionStorageMemory2 c = new ConditionalExpressionStorageMemory2();
        assert(c.f(true) == 1);
        assert(c.f(false) == 2);
    }
}
