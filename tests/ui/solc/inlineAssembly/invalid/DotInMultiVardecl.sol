//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      function f() -> x, y, z {}
      let a., aa.b := f() //~ ERROR: expected one of `,`, `:=`, `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `.`
    }
  }
}
