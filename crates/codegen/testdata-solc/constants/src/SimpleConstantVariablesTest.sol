// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleConstantVariablesTest {
    uint256 constant x = 56;

    function getX() public pure returns (uint256 r) {
        return x;
    }
}
