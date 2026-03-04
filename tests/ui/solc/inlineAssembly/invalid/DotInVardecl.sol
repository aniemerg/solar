//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      let a. := 2 //~ ERROR: expected one of `,`, `:=`, `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `.`
      let a.. := 2
      let a.b := 2
      let a..b := 2
    }
  }
}
