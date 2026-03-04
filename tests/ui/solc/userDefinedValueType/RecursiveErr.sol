//@ compile-flags: -Ztypeck
type MyInt1 is MyInt2; //~ ERROR: the underlying type of UDVTs must be an elementary value type
type MyInt2 is MyInt1; //~ ERROR: the underlying type of UDVTs must be an elementary value type
