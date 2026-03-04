//@ compile-flags: -Ztypeck
contract C {
  bool constant c = this; //~ ERROR: mismatched types
  function f() public {
    assembly {
        let t := c
    }
  }
}
