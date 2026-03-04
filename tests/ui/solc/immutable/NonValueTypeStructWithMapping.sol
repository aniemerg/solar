//@ compile-flags: -Ztypeck
contract Contract {
    struct S {
        mapping(uint => address) map;
    }

    S immutable s; //~ ERROR: immutable variables cannot have a non-value type
}
