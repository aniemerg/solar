//@ compile-flags: -Ztypeck
event E();
contract E {} //~ ERROR: identifier `E` already declared
