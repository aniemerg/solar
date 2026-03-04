// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibMappingsPublic {
    function set(mapping(uint256 => uint256) storage m, uint256 key, uint256 value) public {
        m[key] = value;
    }
}

contract UsingLibraryMappingsPublic {
    mapping(uint256 => uint256) m1;
    mapping(uint256 => uint256) m2;

    function f() public returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        LibMappingsPublic.set(m1, 0, 1);
        LibMappingsPublic.set(m1, 2, 42);
        LibMappingsPublic.set(m2, 0, 23);
        LibMappingsPublic.set(m2, 2, 99);
        return (m1[0], m1[1], m1[2], m2[0], m2[1], m2[2]);
    }
}
