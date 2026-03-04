//@ compile-flags: -Ztypeck
contract A {
  int immutable a;
  constructor() { a = 5; } //~ ERROR: cannot assign to an immutable variable
  function f() public { --a; } //~ ERROR: cannot assign to an immutable variable
}
