//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    bytes32 b;
    b[-1]; //~ ERROR: mismatched types
  }
}
