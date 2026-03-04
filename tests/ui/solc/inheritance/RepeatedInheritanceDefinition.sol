//@ compile-flags: -Ztypeck
contract A {}
contract B {}
contract C is A is B is B is A{ } //~ ERROR: base contracts already specified
//~^ ERROR: base contracts already specified
//~^^ ERROR: base contracts already specified
