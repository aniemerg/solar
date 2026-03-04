//@ compile-flags: -Ztypeck
struct S { uint256 a; }
struct S { uint256 a; } //~ ERROR: identifier `S` already declared
