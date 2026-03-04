//@ compile-flags: -Ztypeck
type MyString is string; //~ ERROR: the underlying type of UDVTs must be an elementary value type
