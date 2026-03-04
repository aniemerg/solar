// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockCoinbase {
    function f() public view returns (address payable) {
        return payable(block.coinbase);
    }
}
