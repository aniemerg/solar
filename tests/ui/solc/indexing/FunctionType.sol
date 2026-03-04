//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    f[0]; //~ ERROR: cannot index into function ()
  }
}
