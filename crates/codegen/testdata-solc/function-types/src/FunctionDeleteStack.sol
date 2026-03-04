// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionDeleteStack {
    function a() public pure returns (uint256) {
        return 7;
    }

    function run() public returns (uint256) {
        function() internal returns (uint256) y = a;
        delete y;
        return y();
    }
}
