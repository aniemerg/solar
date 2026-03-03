// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireErrorConditionEvaluatedOnce {
    uint256 counter = 0;

    error CustomError(uint256);

    function getCounter() public view returns (uint256) {
        return counter;
    }

    function g(bool condition) internal returns (bool) {
        counter++;
        return condition;
    }

    function f(bool condition) external {
        require(g(condition), CustomError(counter));
    }
}
