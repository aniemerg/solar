// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Denominations {
    uint256 public constant X = 1 ether + 1 gwei + 1 wei;

    function value() public pure returns (uint256) {
        return X;
    }
}
