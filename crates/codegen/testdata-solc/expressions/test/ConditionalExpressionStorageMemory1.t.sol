// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalExpressionStorageMemory1.sol";

contract ConditionalExpressionStorageMemory1Test {
    function test_storageMemoryAssignment() public {
        ConditionalExpressionStorageMemory1 c = new ConditionalExpressionStorageMemory1();
        assert(c.f(true) == 1);
        assert(c.f(false) == 2);
    }
}
