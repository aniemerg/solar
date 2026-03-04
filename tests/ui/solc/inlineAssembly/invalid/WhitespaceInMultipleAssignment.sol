//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      function g() -> a,b, c {}
      let x, y ,z : = g() //~ ERROR: expected one of `,`, `:=`, `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `:`
    }
  }
}
