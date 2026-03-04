// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    // This case used to be affected by the buggy cleanup due to ABIEncoderV2HeadOverflowWithStaticArrayCleanup bug.
    function g(uint[] memory a, uint[1] calldata b) public returns (uint[] memory, uint[1] memory) {
        uint[1] memory bm;
        bm[0] = b[0];
        return (a, bm);
    }
}

contract CalldataArrayDynamicStaticInLibrary {
    function f(uint[] memory a, uint[1] calldata b) public returns (uint[] memory, uint[1] memory) {
        return L.g(a, b);
    }
}
