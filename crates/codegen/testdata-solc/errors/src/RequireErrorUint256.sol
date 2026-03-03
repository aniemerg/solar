// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error CustomErrorUint(uint256);

contract RequireErrorUint256 {
    function f() external pure {
        require(false, CustomErrorUint(1));
    }

    function g() external pure {
        require(false, CustomErrorUint(2));
    }
}
