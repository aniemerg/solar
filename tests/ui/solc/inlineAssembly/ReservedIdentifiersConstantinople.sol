//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      let shl := 1 //~ ERROR: expected identifier, found Yul EVM builtin keyword `shl`
    }
    assembly {
      pop(shl(1, 2))
    }
  }
}
