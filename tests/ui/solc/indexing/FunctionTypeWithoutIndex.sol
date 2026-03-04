//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    f[]; //~ ERROR: cannot index into function ()
  }
}
