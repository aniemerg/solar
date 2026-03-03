// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiDecodeSimple {
    function f(bytes memory data) public pure returns (uint256, bytes memory) {
        return abi.decode(data, (uint256, bytes));
    }
}
