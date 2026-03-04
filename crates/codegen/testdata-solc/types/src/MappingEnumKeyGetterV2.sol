// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingEnumKeyGetterV2 {
    enum E { A, B, C }
    mapping(E => uint8) public table;
    function set(E k, uint8 v) public {
        table[k] = v;
    }
    function get(E k) public view returns (uint8) {
        return this.table(k);
    }
}
