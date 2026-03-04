//@ compile-flags: -Ztypeck
struct S {
    int transient x; //~ ERROR: data locations are not allowed here
}
