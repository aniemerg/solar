// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockChainid.sol";

contract BlockChainidTest {
    function test_BlockChainid() public {
        BlockChainid c = new BlockChainid();
        // chainid should be non-zero
        assert(c.f() > 0);
    }
}
