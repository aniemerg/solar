// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

enum E { A, B, C }

contract MappingEnumKeyV2 {
    mapping(E => uint8) table;
    function get(E k) public view returns (uint8 v) {
        return table[k];
    }
    function set(E k, uint8 v) public {
        table[k] = v;
    }
}
