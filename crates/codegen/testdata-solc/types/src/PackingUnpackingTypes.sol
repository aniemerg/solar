// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PackingUnpackingTypes {
    function run(bool a, uint32 b, uint64 c) public pure returns(uint256 y) {
        if (a) y = 1;
        y = y * 0x100000000 | ~b;
        y = y * 0x10000000000000000 | ~c;
    }
}
