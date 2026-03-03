// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeccakPackedComplexTypes {
    uint120[3] x;

    function f() public returns (bytes32 hash1, bytes32 hash2, bytes32 hash3) {
        uint120[] memory y = new uint120[](3);
        x[0] = y[0] = uint120(type(uint256).max - 1);
        x[1] = y[1] = uint120(type(uint256).max - 2);
        x[2] = y[2] = uint120(type(uint256).max - 3);
        hash1 = keccak256(abi.encodePacked(x));
        hash2 = keccak256(abi.encodePacked(y));
        hash3 = keccak256(abi.encodePacked(KeccakPackedComplexTypes(address(0x1234))));
    }
}
