// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalExpression {
    function trueLiteral() public pure returns (uint256) {
        return true ? 5 : 10;
    }

    function falseLiteral() public pure returns (uint256) {
        return false ? 5 : 10;
    }
}
