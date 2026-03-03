// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UseScratch {
    uint256 immutable x;
    uint256 immutable y;
    mapping(uint => uint) public m;

    constructor(uint _a) {
        x = 42;
        y = 23;
        m[_a] = 7;
        new uint[](4);
    }

    function f() public view returns (uint256, uint256) {
        return (x + x, y);
    }
}
