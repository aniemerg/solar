// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyBytesCopy {
    bytes data;
    bytes otherData;
    function fromMemory() public returns (bytes1) {
        bytes memory t;
        uint[2] memory x;
        x[0] = type(uint).max;
        data = t;
        data.push();
        return data[0];
    }
    function fromCalldata(bytes calldata x) public returns (bytes1) {
        data = x;
        data.push();
        return data[0];
    }
    function fromStorage() public returns (bytes1) {
        // zero-length but dirty higher order bits
        assembly  { sstore(otherData.slot, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00) }
        data = otherData;
        data.push();
        return data[0];
    }
}
