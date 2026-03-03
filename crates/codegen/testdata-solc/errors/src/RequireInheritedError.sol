// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    error CustomError(uint256, string, uint256);
}

contract RequireInheritedError is Base {
    function f() external pure {
        require(false, CustomError(1, "two", 3));
    }
}
