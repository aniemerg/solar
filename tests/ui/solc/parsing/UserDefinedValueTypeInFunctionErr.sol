function f() {
    type(uint).max;
    type MyInt is int; //~ ERROR: expected `(`, found `MyInt`
}
