// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiDecodeStaticArrayV2 {
    function f(bytes calldata data)
        external
        pure
        returns (uint256[2][3] memory)
    {
        return abi.decode(data, (uint256[2][3]));
    }
}
