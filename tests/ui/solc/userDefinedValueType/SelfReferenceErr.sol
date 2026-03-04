//@ compile-flags: -Ztypeck
type MyInt is MyInt; //~ ERROR: the underlying type of UDVTs must be an elementary value type
