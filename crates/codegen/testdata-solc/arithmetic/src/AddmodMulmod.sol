// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddmodMulmod {
    function run() public pure returns (uint256) {
        // Note that this only works because computation on literals is done using
        // unbounded integers.
        if ((2**255 + 2**255) % 7 != addmod(2**255, 2**255, 7)) return 1;
        if ((2**255 + 2**255) % 7 != addmod(2**255, 2**255, 7)) return 2;
        return 0;
    }
}
