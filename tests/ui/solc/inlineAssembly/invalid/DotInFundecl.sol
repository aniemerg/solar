//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      function f.() {} //~ ERROR: expected `(`, found `.`
      function g.f() {}
    }
  }
}
