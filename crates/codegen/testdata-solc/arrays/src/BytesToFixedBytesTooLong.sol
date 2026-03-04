// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesToFixedBytesTooLong {
    bytes s = "abcdefghabcdefghabcdefghabcdefgha";

    function fromMemory(bytes memory m) public pure returns (bytes32) {
        return bytes32(m);
    }
    function fromCalldata(bytes calldata c) external pure returns (bytes32) {
        return bytes32(c);
    }
    function fromStorage() external view returns (bytes32) {
        return bytes32(s);
    }
    function fromSlice(bytes calldata c) external pure returns (bytes32) {
        return bytes32(c[0:33]);
    }
}
