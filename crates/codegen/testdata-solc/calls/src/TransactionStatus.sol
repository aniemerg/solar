// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionStatus {
    function f() public {}
    function g() public { revert(); }
    function h() public { assert(false); }
}
