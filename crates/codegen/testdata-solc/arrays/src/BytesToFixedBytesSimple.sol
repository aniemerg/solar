// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesToFixedBytesSimple {
    bytes s = "abcdefghabcdefgh";
    bytes sLong = "abcdefghabcdefghabcdefghabcdefgh";

    function fromMemory(bytes memory m) public pure returns (bytes16) {
        return bytes16(m);
    }
    function fromCalldata(bytes calldata c) external pure returns (bytes16) {
        return bytes16(c);
    }
    function fromStorage() external view returns (bytes16) {
        return bytes16(s);
    }
    function fromStorageLong() external view returns (bytes32) {
        return bytes32(sLong);
    }
    function fromSlice(bytes calldata c) external pure returns (bytes8) {
        return bytes8(c[1:9]);
    }
}
