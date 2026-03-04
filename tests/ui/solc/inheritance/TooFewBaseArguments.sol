//@ compile-flags: -Ztypeck
contract Base {
  constructor(uint, uint) {}
}
contract Derived is Base(2) { } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 1
contract Derived2 is Base {
  constructor() Base(2) { } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 1
}
