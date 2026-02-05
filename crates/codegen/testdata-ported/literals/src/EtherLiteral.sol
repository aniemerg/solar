// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherLiteral {
    uint256 public constant X = 1 ether;

    function value() public pure returns (uint256) {
        return X;
    }
}
