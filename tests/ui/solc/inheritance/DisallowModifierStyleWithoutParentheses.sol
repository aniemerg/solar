//@ compile-flags: -Ztypeck
contract A { constructor() { } }
contract B is A { constructor() A {  } } //~ ERROR: modifier-style base constructor call without arguments
