//@ compile-flags: -Ztypeck
contract C {
  function f() internal returns (string memory, uint, uint, uint) {
    (uint a, string memory b,,) = f(); //~ ERROR: mismatched types
    a; b;
  }
}
