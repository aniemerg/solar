// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibMappingsReturn {
    function choose(mapping(uint256 => mapping(uint256 => uint256)) storage m, uint256 key) external returns (mapping(uint256 => uint256) storage) {
        return m[key];
    }
}

contract UsingLibraryMappingsReturn {
    mapping(uint256 => mapping(uint256 => uint256)) m;

    function f() public returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        LibMappingsReturn.choose(m, 0)[0] = 1;
        LibMappingsReturn.choose(m, 0)[2] = 42;
        LibMappingsReturn.choose(m, 1)[0] = 23;
        LibMappingsReturn.choose(m, 1)[2] = 99;
        return (m[0][0], m[0][1], m[0][2], m[1][0], m[1][1], m[1][2]);
    }
}
