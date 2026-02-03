// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayAccessor {
    uint256[8] public data;
    uint256[] public dynamicData;
    uint24[] public smallTypeData;

    struct St {
        uint256 a;
        uint256[] finalArray;
    }

    mapping(uint256 => mapping(uint256 => St[5])) public multiple_map;

    constructor() {
        data[0] = 8;

        dynamicData.push();
        dynamicData.push();
        dynamicData.push(8);

        smallTypeData = new uint24[](128);
        smallTypeData[1] = 22;
        smallTypeData[127] = 2;

        multiple_map[2][1][2].a = 3;
        for (uint256 i = 0; i < 4; i++) multiple_map[2][1][2].finalArray.push();
        multiple_map[2][1][2].finalArray[3] = 5;
    }
}
