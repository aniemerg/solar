//@ compile-flags: -Ztypeck
contract test { fallback() external { uint x = 3; int y = -4; x ** y; } } //~ ERROR: cannot apply builtin operator `**` to `uint256` and `int256`
