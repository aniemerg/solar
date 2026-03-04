//@ compile-flags: -Ztypeck
contract C {
  bytes33 b33 = 1; //~ ERROR: unresolved symbol `bytes33`
}
