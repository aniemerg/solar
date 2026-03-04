// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibMapReturnNamed {
    function f(mapping(uint256 => uint256) storage a, mapping(uint256 => uint256) storage b) internal returns (mapping(uint256 => uint256) storage r) {
        r = a;
        r[1] = 42;
        r = b;
        r[1] = 21;
    }
}

contract MappingReturnsInLibraryNamed {
    mapping(uint256 => uint256) a;
    mapping(uint256 => uint256) b;

    function f() public returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        LibMapReturnNamed.f(a, b)[2] = 84;
        return (a[0], a[1], a[2], b[0], b[1], b[2]);
    }

    function g() public returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        mapping(uint256 => uint256) storage m = LibMapReturnNamed.f(a, b);
        m[2] = 17;
        return (a[0], a[1], a[2], b[0], b[1], b[2]);
    }
}
