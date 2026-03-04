//@ compile-flags: -Ztypeck
contract C {
  struct S { function() returns (S storage)[] x; } //~ ERROR: invalid data location `storage`
  S s;
  function f() internal pure returns (uint, uint, uint, S storage, uint, uint) {
    (,,,s.x[2](),,) = f();
  }
}
