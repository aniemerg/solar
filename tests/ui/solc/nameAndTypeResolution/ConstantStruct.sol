//@ compile-flags: -Ztypeck
contract C {
    struct S { uint x; uint[] y; }
    S constant x = S(5, new uint[](4)); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
}
