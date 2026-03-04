// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library D {
    struct s { uint256 a; }
    function mul(s storage self, uint256 x) public returns (uint256) { return self.a *= x; }
}

contract UsingForByName {
    using D for D.s;
    D.s public x;

    function f(uint256 a) public returns (uint256) {
        x.a = 6;
        return x.mul({x: a});
    }
}
