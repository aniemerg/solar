// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyRemovesBytesData {
    function set() public returns (bool) { data1 = msg.data; return true; }
    function reset() public returns (bool) { data1 = data2; return true; }
    bytes data1;
    bytes data2;
}
