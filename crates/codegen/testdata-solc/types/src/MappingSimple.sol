// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingSimple {
    mapping(uint8 => uint8) table;
    function get(uint8 k) public view returns (uint8 v) {
        return table[k];
    }
    function set(uint8 k, uint8 v) public {
        table[k] = v;
    }
}
