//@ compile-flags: -Ztypeck
type MyFunction is function(uint) returns (uint); //~ ERROR: the underlying type of UDVTs must be an elementary value type
