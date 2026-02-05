// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WeiLiteral {
    uint256 public constant X = 1 wei;

    function value() public pure returns (uint256) {
        return X;
    }
}
