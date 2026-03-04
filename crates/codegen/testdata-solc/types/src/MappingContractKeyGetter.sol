// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface A {}

contract MappingContractKeyGetter {
    mapping(A => uint8) public table;
    function set(A k, uint8 v) public {
        table[k] = v;
    }
    function get(A k) public view returns (uint8) {
        return this.table(k);
    }
}
