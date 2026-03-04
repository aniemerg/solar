//@ compile-flags: -Ztypeck
contract S {}
struct S { uint256 a; } //~ ERROR: identifier `S` already declared
