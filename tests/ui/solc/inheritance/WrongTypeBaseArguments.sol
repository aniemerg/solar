//@ compile-flags: -Ztypeck
contract Base {
  constructor(uint8) {}
}
contract Derived is Base(300) { } //~ ERROR: mismatched types
contract Derived2 is Base {
  constructor() Base(2) { }
}
