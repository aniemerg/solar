// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiDecodeTrivial {
    function f(bytes memory data) public pure returns (uint256) {
        return abi.decode(data, (uint256));
    }
}
