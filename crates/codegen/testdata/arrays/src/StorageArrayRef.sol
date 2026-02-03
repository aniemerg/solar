// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {
    /// Finds the position of _value in the sorted list _data.
    function find(uint256[] storage _data, uint256 _value) internal returns (uint256 o_position) {
        return find(_data, 0, _data.length, _value);
    }

    function find(
        uint256[] storage _data,
        uint256 _begin,
        uint256 _len,
        uint256 _value
    ) private returns (uint256 o_position) {
        if (_len == 0 || (_len == 1 && _data[_begin] != _value)) {
            return type(uint256).max;
        }
        uint256 halfLen = _len / 2;
        uint256 v = _data[_begin + halfLen];
        if (_value < v) {
            return find(_data, _begin, halfLen, _value);
        } else if (_value > v) {
            return find(_data, _begin + halfLen + 1, halfLen - 1, _value);
        } else {
            return _begin + halfLen;
        }
    }
}

contract StorageArrayRef is BinarySearch {
    uint256[] data;

    function add(uint256 v) public {
        data.push(0);
        data[data.length - 1] = v;
    }

    function findValue(uint256 v) public returns (uint256) {
        return find(data, v);
    }
}
