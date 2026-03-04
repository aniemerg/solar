// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simplified from multi-source recursive import test.
// Original: Source A self-imports to attach using directives to T globally.
// Using {f} for T (increments by 1) and {g} for T (adds 10 to unwrapped).
// cr() returns T(0), cr().f() = T(1), cr().f().g() = 11.

type T is uint;

function fT(T x) pure returns (T) { return T.wrap(T.unwrap(x) + 1); }
function gT(T x) pure returns (uint) { return T.unwrap(x) + 10; }
function cr() pure returns (T) { return T.wrap(0); }

using {fT} for T global;
using {gT} for T global;

contract RecursiveImport {
    function f() public pure returns (uint) {
        return cr().fT().gT();
    }
}
