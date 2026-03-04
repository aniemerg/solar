//@ compile-flags: -Ztypeck
contract Base {
  constructor(uint) {}
}
contract Derived is Base(2) { }
contract Derived2 is Base(), Derived() { } //~ ERROR: wrong number of arguments for base constructor: expected 1, found 0
