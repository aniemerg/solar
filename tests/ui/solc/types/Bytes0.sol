//@ compile-flags: -Ztypeck
contract C {
  bytes0 b0 = 1; //~ ERROR: unresolved symbol `bytes0`
}
