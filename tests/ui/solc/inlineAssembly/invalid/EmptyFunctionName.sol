//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      function (a, b) {} //~ ERROR: expected identifier, found `(`
    }
  }
}
