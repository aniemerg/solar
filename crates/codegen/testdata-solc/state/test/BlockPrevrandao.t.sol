// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockPrevrandao.sol";

contract BlockPrevrandaoTest {
    function test_BlockPrevrandao() public {
        BlockPrevrandao c = new BlockPrevrandao();
        // block.prevrandao returns the same value each call within a block
        assert(c.f() == block.prevrandao);
    }
}
