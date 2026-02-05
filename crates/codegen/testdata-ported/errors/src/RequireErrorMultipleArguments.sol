// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error CustomErrorMulti(uint256, string, uint256);

contract RequireErrorMultipleArguments {
    function f() external pure {
        require(false, CustomErrorMulti(1, "two", 3));
    }

    function g() external pure {
        require(false, CustomErrorMulti(4, "five", 6));
    }
}
