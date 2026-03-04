contract C {
    uint immutable immutable x; //~ ERROR: mutability already specified
    uint immutable constant x; //~ ERROR: mutability already specified
}
