//@ compile-flags: -Ztypeck
contract C {
  bytes256 b256 = 1; //~ ERROR: unresolved symbol `bytes256`
}
