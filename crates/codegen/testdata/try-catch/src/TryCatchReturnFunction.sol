// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchReturnFunction {
    function g() public returns (uint256 a, function() external h, uint256 b) {
        a = 1;
        h = TryCatchReturnFunction(address(0x1234)).fun;
        b = 9;
    }

    function f() public returns (uint256, function() external, uint256) {
        try this.g() returns (uint256 a, function() external h, uint256 b) {
            return (a, h, b);
        } catch {
        }
    }

    function fun() public pure {}
}
