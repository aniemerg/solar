//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      function f(a., x.b) -> t.b, b.. {} //~ ERROR: expected one of `)` or `,`, found `.`
    }
  }
}
