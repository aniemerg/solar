// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructCopy {
    struct Nested {
        uint256 x;
        uint256 y;
    }

    struct Struct {
        uint256 a;
        Nested nested;
        uint256 c;
    }

    mapping(uint256 => Struct) data;

    function set(uint256 k) public returns (bool) {
        data[k].a = 1;
        data[k].nested.x = 3;
        data[k].nested.y = 4;
        data[k].c = 2;
        return true;
    }

    function copy(uint256 from, uint256 to) public returns (bool) {
        data[to] = data[from];
        return true;
    }

    function retrieve(uint256 k) public view returns (uint256 a, uint256 x, uint256 y, uint256 c) {
        a = data[k].a;
        x = data[k].nested.x;
        y = data[k].nested.y;
        c = data[k].c;
    }
}
