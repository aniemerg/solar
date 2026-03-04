// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UncalledBlockhash.sol";

contract UncalledBlockhashTest {
    function test_UncalledBlockhash() public {
        UncalledBlockhash c = new UncalledBlockhash();
        // (blockhash) syntax (parenthesized) works the same as blockhash
        // The previous block hash is available
        bytes32 h = c.f();
        // It returns the same value as regular blockhash call
        assert(h == blockhash(block.number - 1));
    }
}
