//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      function k() {}

      k
    } //~ ERROR: expected one of `(`, `,`, or `:=`, found `}`
  }
}
