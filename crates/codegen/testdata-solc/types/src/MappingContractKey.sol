// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface A {}

contract MappingContractKey {
    mapping(A => uint8) table;
    function get(A k) public view returns (uint8 v) {
        return table[k];
    }
    function set(A k, uint8 v) public {
        table[k] = v;
    }
}
