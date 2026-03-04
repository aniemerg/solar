//@ compile-flags: -Ztypeck
contract A { constructor() { } }
contract B is A { constructor() A() {  } }
