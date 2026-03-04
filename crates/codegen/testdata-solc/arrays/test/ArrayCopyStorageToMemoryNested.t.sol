// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageToMemoryNested.sol";

contract ArrayCopyStorageToMemoryNestedTest {
    function test_ArrayCopyStorageToMemoryNested() public {
        ArrayCopyStorageToMemoryNested c = new ArrayCopyStorageToMemoryNested();
        // f() -> 0x20, 2, 0x40, 0xa0, 2, 0, 1, 2, 2, 3
        uint[][] memory result = c.f();
        assert(result.length == 2);
        assert(result[0].length == 2);
        assert(result[0][0] == 0);
        assert(result[0][1] == 1);
        assert(result[1].length == 2);
        assert(result[1][0] == 2);
        assert(result[1][1] == 3);
    }
}
