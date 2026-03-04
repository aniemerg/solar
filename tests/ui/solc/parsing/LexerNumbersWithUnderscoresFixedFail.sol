contract C {
  function f() public pure {
    fixed F1 = 3.1415_; //~ ERROR: invalid use of underscores in number literal
    fixed F2 = 3__1.4__15; //~ ERROR: invalid use of underscores in number literal
    fixed F3 = 1_.2; //~ ERROR: invalid use of underscores in number literal
    fixed F4 = 1._2; //~ ERROR: invalid use of underscores in number literal
    fixed F5 = 1.2e_12; //~ ERROR: invalid use of underscores in number literal
    fixed F6 = 1._; //~ ERROR: empty rational
  }
}
