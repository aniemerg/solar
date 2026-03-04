//@ compile-flags: -Ztypeck
contract A is B { } //~ ERROR: definition of base has to precede definition of derived contract
contract B is A { } //~ ERROR: linearization of inheritance graph impossible
