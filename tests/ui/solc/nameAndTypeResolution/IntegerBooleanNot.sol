//@ compile-flags: -Ztypeck
contract test { fallback() external { uint x = 1; !x; } } //~ ERROR: cannot apply unary operator `!` to `uint256`
