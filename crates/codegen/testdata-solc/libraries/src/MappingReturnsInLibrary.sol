// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibMapReturn {
    function choose_mapping(mapping(uint256 => uint256) storage a, mapping(uint256 => uint256) storage b, bool c) internal pure returns (mapping(uint256 => uint256) storage) {
        return c ? a : b;
    }
}

contract MappingReturnsInLibrary {
    mapping(uint256 => uint256) a;
    mapping(uint256 => uint256) b;

    function set(bool choice, uint256 key, uint256 value) public returns (uint256) {
        mapping(uint256 => uint256) storage m = LibMapReturn.choose_mapping(a, b, choice);
        uint256 oldValue = m[key];
        m[key] = value;
        return oldValue;
    }

    function get(bool choice, uint256 key) public view returns (uint256) {
        return LibMapReturn.choose_mapping(a, b, choice)[key];
    }

    function get_a(uint256 key) public view returns (uint256) {
        return a[key];
    }

    function get_b(uint256 key) public view returns (uint256) {
        return b[key];
    }
}
