contract C {
  function f() public pure {
    uint D1 = 1234_; //~ ERROR: invalid use of underscores in number literal
    uint D2 = 12__34; //~ ERROR: invalid use of underscores in number literal
    uint D3 = 12_e34; //~ ERROR: invalid use of underscores in number literal
    uint D4 = 12e_34; //~ ERROR: invalid use of underscores in number literal
  }
}
