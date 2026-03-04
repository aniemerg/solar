// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesInsideMappings {
    function set(uint key) public returns (bool) { data[key] = msg.data; return true; }
    function copy(uint from, uint to) public returns (bool) { data[to] = data[from]; return true; }
    mapping(uint => bytes) data;
}
