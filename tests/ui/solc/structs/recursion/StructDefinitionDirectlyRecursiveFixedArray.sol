//@ compile-flags: -Ztypeck
contract Test {
    struct MyStructName { //~ ERROR: recursive struct definition
        address addr;
        MyStructName[1] x;
    }
}
