//@ compile-flags: -Ztypeck
contract Test {
    struct MyStructName {
        address addr;
        MyStructName[] x;
    }
}
