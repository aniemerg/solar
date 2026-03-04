// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayNestedMemoryToStorage.sol";

contract ArrayNestedMemoryToStorageTest {
    function test_ArrayNestedMemoryToStorage() public {
        ArrayNestedMemoryToStorage c = new ArrayNestedMemoryToStorage();
        // test() -> 24
        assert(c.runTest() == 24);
        // run1() -> 3
        assert(c.run1() == 3);
        // run2() -> 6
        assert(c.run2() == 6);
        // run3() -> 24
        assert(c.run3() == 24);
    }
}
