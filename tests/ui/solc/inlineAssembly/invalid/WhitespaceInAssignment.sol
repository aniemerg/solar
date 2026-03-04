//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      let x : = mload(0) //~ ERROR: expected one of `,`, `:=`, `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `:`
    }
  }
}
