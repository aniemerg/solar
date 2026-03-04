//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    assembly {
      let x := 0100 //~ ERROR: leading zeros are not allowed in integers
    }
  }
}
