// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteRemovesBytesData {
    fallback() external { data = msg.data; }
    function del() public returns (bool) { delete data; return true; }
    bytes data;
}
