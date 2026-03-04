//@ compile-flags: -Ztypeck
contract C {
  struct S {uint x;}
  constructor(S) {} //~ ERROR: expected data location
}
