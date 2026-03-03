// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The purpose of this test is to make sure that error constructor call
// stack items are popped from the stack in the success branch, i.e. when
// require condition is true.
contract RequireErrorStackCheck {
    error E(uint, uint, uint, function(uint256) external pure returns (uint256));
    uint public x;

    function e(uint256 y) external pure returns (uint256) {
        return y;
    }

    function f(bool condition, uint a, uint b, uint c) public {
        require(condition, E(a, b, c, this.e));
        x = b;
    }
}
