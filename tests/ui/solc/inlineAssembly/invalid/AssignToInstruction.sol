//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      let mod := 2 //~ ERROR: expected identifier, found Yul EVM builtin keyword `mod`
    }
  }
}
