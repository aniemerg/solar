//@ compile-flags: -Ztypeck
contract Contract {
    struct S {
        int k;
    }

    S immutable s; //~ ERROR: immutable variables cannot have a non-value type
}
