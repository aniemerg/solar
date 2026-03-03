// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryArraysDynamicIndexAccessWrite.sol";

contract MemoryArraysDynamicIndexAccessWriteTest {
    function test_MemoryArraysDynamicIndexAccessWrite() public {
        MemoryArraysDynamicIndexAccessWrite c = new MemoryArraysDynamicIndexAccessWrite();
        uint24[3][] memory result = c.f();
        assert(result.length == 4);
        assert(result[2][2] == 1);
        assert(result[3][2] == 7);
    }
}
