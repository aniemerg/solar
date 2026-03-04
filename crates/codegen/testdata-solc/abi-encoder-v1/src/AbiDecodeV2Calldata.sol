// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiDecodeV2Calldata {
    struct S {
        uint256 a;
        uint256[] b;
    }

    function f(bytes calldata data) external pure returns (S memory) {
        return abi.decode(data, (S));
    }
}
