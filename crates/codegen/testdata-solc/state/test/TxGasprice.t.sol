// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TxGasprice.sol";

contract TxGaspriceTest {
    function test_TxGasprice() public {
        TxGasprice c = new TxGasprice();
        assert(c.f() == tx.gasprice);
    }
}
