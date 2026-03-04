// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LMapping {
    function at(mapping(uint256 => uint256) storage a, uint256 i) internal view returns (uint256) {
        return a[i];
    }
}

contract InternalLibraryFunctionAttachedToMapping {
    using LMapping for mapping(uint256 => uint256);

    mapping(uint256 => uint256) map;

    function mapValue(uint256 a) public returns (uint256) {
        map[42] = 0x24;
        map[66] = 0x66;

        return map.at(a);
    }
}
