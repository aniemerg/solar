// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library DOverload {
    struct s { uint256 a; }
    function mul(s storage self, uint256 x) public returns (uint256) { return self.a *= x; }
    function mul(s storage self, bytes32 x) public returns (bytes32) { }
}

contract UsingForOverload {
    using DOverload for DOverload.s;
    DOverload.s public x;

    function f(uint256 a) public returns (uint256) {
        x.a = 6;
        return x.mul(a);
    }
}
