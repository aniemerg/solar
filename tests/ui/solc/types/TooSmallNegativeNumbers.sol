//@ compile-flags: -Ztypeck
contract C {
  fixed8x80 a = -1e-100; //~ ERROR: rational part too large
}
