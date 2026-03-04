//@ compile-flags: -Ztypeck
contract A {}
contract B {}
contract C is A, B is B{ } //~ ERROR: base contracts already specified
