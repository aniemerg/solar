// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UninitializedInternalStorageFunctionCall {
    function() internal x;

    function f() public returns (uint256 r) {
        x();
        return 2;
    }
}
