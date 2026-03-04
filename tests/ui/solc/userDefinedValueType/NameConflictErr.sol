//@ compile-flags: -Ztypeck
type MyInt is int;
type MyInt is address; //~ ERROR: identifier `MyInt` already declared
contract C {
    type MyAddress is address;
    type MyAddress is address; //~ ERROR: identifier `MyAddress` already declared
}
