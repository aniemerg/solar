// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error CustomError(function(uint256) external pure returns (uint256));

contract RequireErrorFunctionPointerParameter {
    function e(uint256 x) external pure returns (uint256) {
        return x;
    }

    function f() external view {
        // more than one stack slot
        require(false, CustomError(RequireErrorFunctionPointerParameter(address(0x1234)).e));
    }
}
