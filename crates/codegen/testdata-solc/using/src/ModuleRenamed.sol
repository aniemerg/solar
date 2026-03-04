// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simplified from multi-source module_renamed test.
// Source A: function f(x) = x+2, function g(x) = x+8
// Source B: import {f as g, g as f} from "A" (swapped names)
// Source C: using {M.g, M.f} for uint where M = Source B
//   So x.f() calls B.f which is A.g = x+8
//      x.g() calls B.g which is A.f = x+2
// run(1, 1) -> (1.fMethod(), 1.gMethod()) = (1+8, 1+2) = (9, 3)

// In this simplified single-file version:
// fOrig = original A.f = x+2, gOrig = original A.g = x+8
// After renaming: fMethod = B.f = A.g = x+8, gMethod = B.g = A.f = x+2

function fOrig(uint x) pure returns (uint) { return x + 2; }
function gOrig(uint x) pure returns (uint) { return x + 8; }

// After renaming: f -> gOrig, g -> fOrig (swapped)
function fMethod(uint x) pure returns (uint) { return gOrig(x); } // x+8
function gMethod(uint x) pure returns (uint) { return fOrig(x); } // x+2

using {fMethod} for uint;
using {gMethod} for uint;

contract ModuleRenamed {
    function run(uint x, uint y) public pure returns (uint, uint) {
        return (x.fMethod(), y.gMethod());
    }
}
