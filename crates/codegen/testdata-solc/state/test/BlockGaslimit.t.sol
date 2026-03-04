// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockGaslimit.sol";

contract BlockGaslimitTest {
    function test_BlockGaslimit() public {
        BlockGaslimit c = new BlockGaslimit();
        // block.gaslimit should be positive
        assert(c.f() > 0);
        assert(c.f() == block.gaslimit);
    }
}
