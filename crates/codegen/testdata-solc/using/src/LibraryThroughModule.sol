// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Combined from multi-source: A (library L) and B (contract C using M.L)
library L {
    function id(uint x) internal pure returns (uint) {
        return x;
    }
    function one_ext(uint) pure external returns(uint) {
        return 1;
    }
    function empty() pure internal {
    }
}

contract LibraryThroughModule {
    using L for uint;
    function f(uint x) public pure returns (uint) {
        return x.id();
    }
    function g(uint x) public pure returns (uint) {
        return x.one_ext();
    }
}
