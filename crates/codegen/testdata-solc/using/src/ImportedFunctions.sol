// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simplified from multi-source imported_functions test.
// Source A: function inc(uint x) returns x+1
// Source B: contract C with using {A.inc, inc} for uint where f = imported inc
// C.f(x) = x.f() + x.inc() = (x+1) + (x+1) = 2*(x+1)
// Test: f(5) -> 12, f(10) -> 22

function inc(uint x) pure returns (uint) {
    return x + 1;
}

using {inc} for uint;

contract ImportedFunctions {
    function f(uint x) public pure returns (uint) {
        return x.inc() + x.inc();
    }
}
