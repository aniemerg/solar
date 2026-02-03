// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessorsMappingForArray {
    mapping(uint256 => uint256[8]) public data;
    mapping(uint256 => uint256[]) public dynamicData;

    constructor() {
        data[2][2] = 8;
        for (uint256 i = 0; i < 3; i++) dynamicData[2].push();
        dynamicData[2][2] = 8;
    }
}
