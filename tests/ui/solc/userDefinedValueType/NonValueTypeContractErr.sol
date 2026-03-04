//@ compile-flags: -Ztypeck
contract C {}
type MyContract is C; //~ ERROR: the underlying type of UDVTs must be an elementary value type
