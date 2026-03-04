//@ compile-flags: -Ztypeck
contract C {
  function f() public view {
    C c = address(2); //~ ERROR: invalid explicit type conversion
  }
}
