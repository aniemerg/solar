// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TxGasprice {
    function f() public view returns (uint) {
        return tx.gasprice;
    }
}
