//@ compile-flags: -Ztypeck
contract A is B { } //~ ERROR: definition of base has to precede definition of derived contract
contract B { function f() public { new C(); } }
contract C { function f() public { new A(); } }
