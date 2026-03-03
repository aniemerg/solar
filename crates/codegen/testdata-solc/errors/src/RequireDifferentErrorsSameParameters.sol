// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error AnError(uint256, string, uint256);
error AnotherError(uint256, string, uint256);

contract RequireDifferentErrorsSameParameters {
    function f() external pure {
        require(false, AnError(1, "two", 3));
    }

    function g() external pure {
        require(false, AnotherError(4, "five", 6));
    }
}
