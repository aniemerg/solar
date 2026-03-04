// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockDifficultyPostParis.sol";

contract BlockDifficultyPostParisTest {
    function test_BlockDifficultyPostParis() public {
        BlockDifficultyPostParis c = new BlockDifficultyPostParis();
        // Post-paris: block.difficulty == block.prevrandao
        assert(c.f() == block.difficulty);
        assert(c.f() == block.prevrandao);
    }
}
