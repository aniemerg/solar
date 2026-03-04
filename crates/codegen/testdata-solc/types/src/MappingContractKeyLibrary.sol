// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface A {}

library L {
    function get(mapping(A => uint8) storage table, A k) external view returns (uint8) {
        return table[k];
    }
    function set(mapping(A => uint8) storage table, A k, uint8 v) external {
        table[k] = v;
    }
}

contract MappingContractKeyLibrary {
    mapping(A => uint8) table;
    function get(A k) public view returns (uint8 v) {
        return L.get(table, k);
    }
    function set(A k, uint8 v) public {
        L.set(table, k, v);
    }
}
