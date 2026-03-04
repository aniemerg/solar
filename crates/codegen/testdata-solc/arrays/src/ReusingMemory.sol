// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReusingMemoryHelper {
    uint256 public flag;

    constructor(uint256 x) {
        flag = x;
    }
}

contract ReusingMemory {
    mapping(uint256 => uint256) map;

    function f(uint256 x) public returns (uint256) {
        map[x] = x;
        return
            (new ReusingMemoryHelper(uint256(keccak256(abi.encodePacked(this.g(map[x]))))))
                .flag();
    }

    function g(uint256 a) public returns (uint256) {
        return map[a];
    }
}
