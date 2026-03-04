//@ compile-flags: -Ztypeck
type MyInt is int;
type MyInt is int; //~ ERROR: identifier `MyInt` already declared
type MyAddress is address;
type MyAddress is uint; //~ ERROR: identifier `MyAddress` already declared
