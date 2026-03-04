//@ compile-flags: -Ztypeck
contract A {}
contract B {}
contract C {
  function f() public pure {
    B b = B(new A()); //~ ERROR: invalid explicit type conversion
  }
}
