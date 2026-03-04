//@ compile-flags: -Ztypeck
contract C {
    struct S {
        mapping(uint => uint) x;
    }
    S public constant c; //~ ERROR: constant variable must be initialized
}
