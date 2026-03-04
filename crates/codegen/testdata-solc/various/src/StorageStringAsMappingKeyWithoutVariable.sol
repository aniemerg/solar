// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageStringAsMappingKeyWithoutVariable {
    mapping(string => uint256) data;

    function f() public returns (uint256) {
        data["abc"] = 2;
        return data["abc"];
    }
}
