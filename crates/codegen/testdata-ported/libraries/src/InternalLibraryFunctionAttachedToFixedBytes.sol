// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LFixedBytes {
    function add(bytes2 a, bytes2 b) internal pure returns (bytes2) {
        return bytes2(uint16(a) + uint16(b));
    }
}

contract InternalLibraryFunctionAttachedToFixedBytes {
    using LFixedBytes for bytes2;

    function sum(bytes2 a, bytes2 b) public pure returns (bytes2) {
        return a.add(b);
    }
}
