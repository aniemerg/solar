// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Combined from multi-source: A (type T + library L + using directives), B (contract C), C (contract D)
// The original test verifies that using-global attached functions are available even when
// the type is not directly named (via cross-module chaining).

type T is uint;

library L {
    function inc(T x) internal pure returns (T) {
        return T.wrap(T.unwrap(x) + 1);
    }
    function dec(T x) external pure returns (T) {
        return T.wrap(T.unwrap(x) - 1);
    }
}

using L for T global;

function toUint(T x) pure returns (uint) {
    return T.unwrap(x);
}

using {toUint} for T global;

contract InnerC {
    function f() public pure returns (T r1) {
        r1 = r1.inc().inc();
    }
}

contract UsingGlobalInvisible {
    function test() public returns (uint) {
        InnerC c = new InnerC();
        // c.f() returns T(2), then .inc().inc().dec() = T(3), then toUint = 3
        return c.f().inc().inc().dec().toUint();
    }
}
