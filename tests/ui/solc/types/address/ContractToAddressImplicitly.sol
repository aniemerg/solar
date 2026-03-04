//@ compile-flags: -Ztypeck
contract C {
  function f() public view {
    address a = this; //~ ERROR: mismatched types
    a;
  }
}
