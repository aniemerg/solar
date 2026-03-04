//@ compile-flags: -Ztypeck
contract A { function Err() public pure {} }
contract B is A { error Err(); } //~ ERROR: identifier `Err` already declared
