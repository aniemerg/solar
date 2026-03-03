// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LBytes {
    function reverse(bytes calldata _b) internal pure returns (bytes1, bytes1) {
        return (_b[1], _b[0]);
    }
}

contract CalldataAttachedToBytes {
    using LBytes for bytes;

    function test(uint256, bytes calldata _b, uint256) external pure returns (bytes1, bytes1) {
        return _b.reverse();
    }
}
