// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockCoinbase.sol";

contract BlockCoinbaseTest {
    function test_BlockCoinbase() public {
        BlockCoinbase c = new BlockCoinbase();
        // block.coinbase returns an address
        address payable cb = c.f();
        assert(cb == block.coinbase);
    }
}
