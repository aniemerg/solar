//@ compile-flags: -Ztypeck
struct S { uint x; }
S constant s; //~ ERROR: constant variable must be initialized
