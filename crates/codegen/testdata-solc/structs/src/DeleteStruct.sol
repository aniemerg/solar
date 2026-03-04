// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteStruct {
    struct nestedStruct {
        uint nestedValue;
        mapping(uint => bool) nestedMapping;
    }
    struct topStruct {
        nestedStruct nstr;
        uint topValue;
        mapping(uint => uint) topMapping;
    }
    uint toDelete;
    topStruct str;

    constructor() {
        toDelete = 5;
        str.topValue = 1;
        str.topMapping[0] = 1;
        str.topMapping[1] = 2;

        str.nstr.nestedValue = 2;
        str.nstr.nestedMapping[0] = true;
        str.nstr.nestedMapping[1] = false;
        delete str;
        delete toDelete;
    }

    function getToDelete() public view returns (uint res) {
        res = toDelete;
    }

    function getTopValue() public view returns (uint topValue) {
        topValue = str.topValue;
    }

    function getNestedValue() public view returns (uint nestedValue) {
        nestedValue = str.nstr.nestedValue;
    }

    function getTopMapping(uint index) public view returns (uint ret) {
        ret = str.topMapping[index];
    }

    function getNestedMapping(uint index) public view returns (bool ret) {
        return str.nstr.nestedMapping[index];
    }
}
