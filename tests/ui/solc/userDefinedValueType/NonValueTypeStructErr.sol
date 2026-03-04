//@ compile-flags: -Ztypeck
struct S {uint x;}

contract C {
    type MyType is S; //~ ERROR: the underlying type of UDVTs must be an elementary value type
}
