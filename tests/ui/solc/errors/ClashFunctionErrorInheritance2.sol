//@ compile-flags: -Ztypeck
contract A { function Err() public pure {} }
contract B { error Err(); } //~ ERROR: identifier `Err` already declared
contract C is A, B {}
