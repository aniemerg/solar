// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library D {
    struct s {
        uint a;
    }

    function mul(s storage self, uint x) public returns (uint) {
        return self.a *= x;
    }
}

contract UsingForFunctionOnStruct {
    using D for D.s;
    D.s public x;

    function f(uint a) public returns (uint) {
        x.a = 3;
        return x.mul(a);
    }
}
