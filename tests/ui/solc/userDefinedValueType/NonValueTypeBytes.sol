//@ compile-flags: -Ztypeck
type MyBytes is bytes; //~ ERROR: the underlying type of UDVTs must be an elementary value type
