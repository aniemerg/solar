//@ compile-flags: -Ztypeck
contract Test {
    struct MyStructName { //~ ERROR: recursive struct definition
        address addr;
        MyStructName x;
    }
}
