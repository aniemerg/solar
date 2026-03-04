// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

enum E { A, B, C }

library L {
    function get(mapping(E => uint8) storage table, E k) external view returns (uint8) {
        return table[k];
    }
    function set(mapping(E => uint8) storage table, E k, uint8 v) external {
        table[k] = v;
    }
}

contract MappingEnumKeyLibraryV2 {
    mapping(E => uint8) table;
    function get(E k) public view returns (uint8 v) {
        return L.get(table, k);
    }
    function set(E k, uint8 v) public {
        L.set(table, k, v);
    }
}
