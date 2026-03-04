//@ compile-flags: -Ztypeck
struct S { uint256 a; }
contract S {} //~ ERROR: identifier `S` already declared
