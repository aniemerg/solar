// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// tests encoding from storage arrays
contract StorageArrayEncoding {
    uint256[2][] tmp_h;
    function h(uint256[2][] calldata s) external returns (bytes memory) {
        tmp_h = s;
        return abi.encode(tmp_h);
    }
    uint256[2][2] tmp_i;
    function i(uint256[2][2] calldata s) external returns (bytes memory) {
        tmp_i = s;
        return abi.encode(tmp_i);
    }
}
