//@ compile-flags: -Ztypeck
contract A { constructor(uint a) { } }
contract B is A { } //~ ERROR: wrong number of arguments for base constructor: expected 1, found 0
