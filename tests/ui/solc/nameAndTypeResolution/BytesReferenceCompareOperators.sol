//@ compile-flags: -Ztypeck
contract test { bytes a; bytes b; fallback() external { a == b; } } //~ ERROR: cannot apply builtin operator `==` to `bytes storage` and `bytes storage`
