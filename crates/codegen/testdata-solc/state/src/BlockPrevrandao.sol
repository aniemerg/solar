// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockPrevrandao {
    function f() public view returns (uint) {
        return block.prevrandao;
    }
}
