//@ compile-flags: -Ztypeck
library L {
  function f(uint, uint) public {}
  function f(uint) public {}
}
contract C {
  function g() public { L.f(1, 2, 3); } //~ ERROR: member `f` not found on type `type(library L)`
}
