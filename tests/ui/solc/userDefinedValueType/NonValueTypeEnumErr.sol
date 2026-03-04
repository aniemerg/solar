//@ compile-flags: -Ztypeck
enum E {A, B, C}

type MyType is E; //~ ERROR: the underlying type of UDVTs must be an elementary value type
