// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibMapArgs {
    function set(mapping(uint256 => uint256) storage m, uint256 key, uint256 value) internal {
        m[key] = value;
    }
    function get(mapping(uint256 => uint256) storage m, uint256 key) internal view returns (uint256) {
        return m[key];
    }
}

contract MappingArgumentsInLibrary {
    mapping(uint256 => uint256) m;

    function set(uint256 key, uint256 value) public returns (uint256) {
        uint256 oldValue = LibMapArgs.get(m, key);
        LibMapArgs.set(m, key, value);
        return oldValue;
    }

    function get(uint256 key) public view returns (uint256) {
        return LibMapArgs.get(m, key);
    }
}
