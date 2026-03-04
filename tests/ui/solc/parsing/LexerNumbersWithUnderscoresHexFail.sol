contract C {
  function f() public pure {
    uint X1 = 0x1234__1234__1234__123; //~ ERROR: invalid use of underscores in number literal
  }
}
