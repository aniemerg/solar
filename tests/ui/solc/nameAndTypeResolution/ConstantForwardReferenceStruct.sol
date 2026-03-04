//@ compile-flags: -Ztypeck
S constant x; //~ ERROR: constant variable must be initialized
struct S { int y; }
