//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      let a, .a, aa.b := f() //~ ERROR: expected identifier, found `.`
    }
  }
}
