// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NestedArrayOfStructsStorageToStorage.sol";

contract NestedArrayOfStructsStorageToStorageTest {
    function test_NestedArrayOfStructsStorageToStorage() public {
        NestedArrayOfStructsStorageToStorage c = new NestedArrayOfStructsStorageToStorage();
        // test1() -> (no revert)
        c.run1();
        // test2() -> (no revert)
        c.run2();
        // test3() -> (no revert)
        c.run3();
    }
}
