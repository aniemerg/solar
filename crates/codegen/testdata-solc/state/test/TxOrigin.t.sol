// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TxOrigin.sol";

contract TxOriginTest {
    function test_TxOrigin() public {
        TxOrigin c = new TxOrigin();
        assert(c.f() == tx.origin);
    }
}
