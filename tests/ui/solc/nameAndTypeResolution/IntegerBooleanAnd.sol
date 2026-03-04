//@ compile-flags: -Ztypeck
contract test { fallback() external { uint x = 1; uint y = 2; x && y; } } //~ ERROR: cannot apply builtin operator `&&` to `uint256` and `uint256`
