//@ compile-flags: -Ztypeck
contract A { constructor(uint) { } }
contract B is A(2) { constructor() A(3) {  } } //~ ERROR: base constructor arguments given twice
