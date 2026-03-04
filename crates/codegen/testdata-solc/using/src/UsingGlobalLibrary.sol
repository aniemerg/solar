// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Combined from multi-source: A (type T + library L) and B (contract C)
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

contract UsingGlobalLibrary {
    function f() public pure returns (T r1, T r2) {
        r1 = r1.inc().inc();
        r2 = r1.dec();
    }
}
