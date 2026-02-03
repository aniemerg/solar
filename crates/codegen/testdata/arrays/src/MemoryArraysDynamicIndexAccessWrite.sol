// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryArraysDynamicIndexAccessWrite {
    uint24[3][][4] data;

    function set(uint24[3][][4] memory x) internal pure returns (uint24[3][][4] memory) {
        x[1][2][2] = 1;
        x[1][3][2] = 7;
        return x;
    }

    function f() public returns (uint24[3][] memory) {
        while (data[1].length < 4) {
            data[1].push();
        }
        return set(data)[1];
    }
}
